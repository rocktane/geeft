class EventsController < ApplicationController
  before_action :set_client, only: [:create, :update,:showdashboard]
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
    @event.list = @event.content($client, @event.lien, @event.subject, @event.budget_min, @event.budget_max, @event.genre, @event.occasion, @event.age,@event.user_id ,@event.id).scan(/\s(.*)/).flatten.map { |match| match.gsub(/\d+\.\s/, "") }
    if @event.save
      respond_to do |format|
        format.json { render json: @event, status: :created }
      end
    else
      render 'new'
    end
  end

  # Affiche de la list
  def show
    @event = Event.find(params[:id])
  end

  # Modification de la liste de cadeaux
  def update
    @event = Event.find(params[:id])
    post_prompt = params[:post_prompt]
    @event.update(list: @event.update_content(post_prompt, $client)
                              .scan(/\s(.*)/)
                              .flatten.map { |match| match.gsub(/\d+\.\s/, "") })
    while @event.list.count == 1
      @event.update(list: @event.update_content(post_prompt, $client)
                                .scan(/\s(.*)/)
                                .flatten.map { |match| match.gsub(/\d+\.\s/, "") })
    end
    redirect_to event_path(@event)
  end

  # modif de levenement une fois crée
  def update_from_edit_event
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to dashboard_path(@event)
    else
      render :update_from_edit_event, status: :unprocessable_entity
    end
  end

  # ca j'ai pas compris
  def saveandshowdashboard
    @event = Event.find(params[:id])
  end


  # Génération d'un lien pour partager la liste
  def share
    @event = Event.find(params[:id])
    @event.update(event_params)
    render 'show'
  end

  def showdashboard
    @event = Event.find(params[:id])
    if user_signed_in?
      @event.save
    end
  end

  private

  def set_client
    $client = $client ? $client : OpenAI::Client.new
  end

  def event_params
    params.require(:event).permit([list: []], :event_name, :event_date, :event_url, :cagnotte_url, :occasion, :genre, :budget_min, :budget_max, [subject: []], :age, :lien, :user_id, :client, :response, :custom_interest, :id)
  end
end
