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
      @gpt_response = Event.content(@event.lien, @event.subject, @event.budget_min, @event.budget_max, @event.genre, @event.occasion)
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  # Affiche de la list
  def show
    @event = Event.find(params[:id])
    gifts_raw = "1. Un ensemble d'outils de jardinage de qualité\n2. Un abonnement à un service de streaming musical classique\n3. Un livre sur l'art du jardinage français\n4. Un coffret de CD de musique classique\n5. Un cours de cuisine française avec un chef renommé\n6. Une belle plante d'intérieur\n7. Un tablier de cuisine personnalisé\n8. Un ensemble de graines de fleurs françaises\n9. Un cours de jardinage biologique\n10. Un abonnement à un magazine de jardinage\n11. Un ensemble de pots de fleurs en céramique\n12. Un dîner dans un restaurant français réputé\n13. Un livre de recettes de cuisine française\n14. Un abonnement à un service de streaming musical haute qualité\n15. Un hamac de jardin confortable\n16. Un coffret de thé de qualité\n17. Un panier-cadeau de produits du terroir français\n18. Un cours de musique classique en ligne\n19. Un arrosoir design\n20. Un ensemble de produits de soin pour les mains de jardinier\n21. Un cours de dégustation de vins français\n22. Un banc de jardin élégant\n23. Un abonnement à un service de livraison de plantes\n24. Un livre sur l'histoire de la musique classique\n25. Un ensemble de couteaux de cuisine français\n26. Un cours de création de compositions florales\n27. Un fauteuil de jardin confortable\n28. Un cours de pâtisserie française\n29. Un ensemble de musique de relaxation pour le jardin\n30. Un bon pour une journée de jardinage ensemble avec un professionnel."
    @gifts = gifts_raw.scan(/\s(.*)/).flatten.map { |match| match.gsub(/\d+\.\s/, "")  }
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
                                  :budget_min, :budget_max, :subject, :age, :liens, :user_id)
  end
end
