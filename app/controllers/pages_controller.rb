class PagesController < ApplicationController


  # Ajout d'infos pour avoir un évènement
  def save
    @event = Event.find(params[:id])
    @event.save
    redirect_to event_path(@event)
  end

  # Suppression de la liste
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

end
