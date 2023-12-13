class EventsController < ApplicationController


  # Page d'acceuil
  def home
  end

  # Affichage des critères
  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      @gpt_response = Event.content(@event.lien, @event.interests, @event.budget_min, @event.budget_max, @event.genre, @event.occasion)
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  # Affiche de la list
  def show
    @event = Even.find(params[:id])
    @gifts = "['abonnement à un magazine de jardinage','ensemble d'outils de jardinage de qualité','cours de cuisine française avec un chef renommé','enceinte Bluetooth pour écouter de la musique classique','plantes d'intérieur rares','livre sur l'histoire du jardinage','abonnement à un service de streaming musical classique','panier-cadeau avec des produits gastronomiques français','cours de design paysager','concert de musique classique en plein air','coffret d'huiles d'olive et vinaigres balsamiques de qualité','instrument de musique classique (violon, piano, etc.)','abonnement à un service de livraison de plantes','service de cours de musique classique en ligne','ensemble de couteaux de cuisine haut de gamme','statue décorative de jardin','vinyls d'artistes classiques préférés','livre sur la cuisine française','bons pour des heures de jardinage ensemble','bougie parfumée inspirée par le jardin','cours de cuisine française en personne','abonnement à un magazine de musique classique','siège de jardin confortable','coffret de chocolats fins français','concert privé de musique classique à domicile','plantes aromatiques pour le jardin ou la cuisine','table de jardin pliante pour les repas en plein air','partitions musicales originales','abonnement à un service de streaming de concerts classiques','coffret de thés de qualité']"
  end

  # Modification de la liste de cadeaux
  def edit
    @event = Event.find(params[:id])
  end

  # Modification de la liste de cadeaux
  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
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
                                  :budget_min, :budget_max, :subject, :age, :lien, :user_id)
  end
end
