class PagesController < ApplicationController


  # Ajout d'infos pour avoir un évènement
  def save
    if user_signed_in?
      @event = Event.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def savetodashboard
  end

  # Suppression de la liste
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

end
