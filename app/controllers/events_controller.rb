class EventsController < ApplicationController
  occasions = %w(anniversaire noël saint-valentin pot-de-départ crémaillère mariage communion baptème aïd autre)
  interests = %w(sport nature musique automobile voyage art mode skin-care make-up technologie humour spectacle livre alcool bien-être atelier cuisine électroménger)

  # Page d'acceuil
  def home
  end

  # Affichage des critères
  def new
    @occasions = occasions
    @interestes = interests
  end

  # Affiche de la list
  def show
    @list = Event.list.first(5)
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
  end

  # Ajout d'infos pour avoir un évènement
  def save
  end

  # Suppression de la liste
  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:list, :event_name, :event_date, :event_url, :cagnotte_url)
  end
end
