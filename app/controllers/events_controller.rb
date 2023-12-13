class EventsController < ApplicationController

  # Page d'acceuil
  def home
  end

  # Affichage des critères
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save!
      gpt_response = @event.content(@event.lien, @event.subject, @event.budget_min, @event.budget_max, @event.genre, @event.occasion, @event.age)
      redirect_to event_path(id: @event.id, response: gpt_response)
    else
      render 'new'
    end
  end

  # Affiche de la list
  def show
    @event = Event.find(params[:id])
    @gifts_raw = params[:response]
    @gifts = gifts_raw.scan(/\s(.*)/).flatten.map { |match| match.gsub(/\d+\.\s/, "") }
  end

  # Modification de la liste de cadeaux
  def edit
    @event = Event.find(params[:id])
  end

  # Modification de la liste de cadeaux
  def update
    @event = Event.find(params[:id])
    @client = Client.find(params[:id])
    new_gift_list = response.update_content(post_prompt.value)
    @gifts = new_gift_list.scan(/\s(.*)/).flatten.map { |match| match.gsub(/\d+\.\s/, "") }
    render 'show'
  end

  # Génération d'un lien pour partager la liste
  def share
    @event = Event.find(params[:id])
    @event.update(event_params)
    render 'show'
  end

  # Ajout d'infos pour avoir un évènement
  def save
    @event = Event.new(event_params)
    @event.save
    redirect_to event_path(@event)
  end

  # Suppression de la liste
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:list, :event_name, :event_date, :event_url, :cagnotte_url, :occasion, :genre,
                                  :budget_min, :budget_max, :subject, :age, :lien, :user_id, :client, :response)
  end
end
