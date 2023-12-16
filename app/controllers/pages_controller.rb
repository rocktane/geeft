class PagesController < ApplicationController
  before_action :set_client, only: [:save, :savetodashboard]

  # Ajout d'infos pour avoir un évènement
  def save
    if user_signed_in?
      @event = Event.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def savetodashboard
    if user_signed_in?
      @event = Event.find(params[:id])
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  # Suppression de la liste
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private

  def set_client
    $client = $client ? $client : OpenAI::Client.new
  end

end
