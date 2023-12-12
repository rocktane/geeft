class EventsController < ApplicationController
  occasions = %w(anniversaire noël saint-valentin pot-de-départ crémaillère mariage communion baptème aïd autre)
  interests = %w(sport nature musique automobile voyage art mode skin-care make-up technologie humour spectacle livre alcool bien-être atelier cuisine électroménger)

  # Page d'acceuil
  def home
  end

  # Affichage des critères
  def new
    @occasions = occasions
    @interests = interests # peut-être mettre les interests dans un array
    # c'est ici que j'effectue mon piluleprompt ou alors directement dans le modèle

    # client = OpenAI::Client.new
    # chaptgpt_response = client.chat(parameters: {
    # model: ENV["MODEL"],
    # messages: [{ role: "user", content: "Je veux une liste de trente cadeaux pour #{@list[params:target]}, cette personne est de sexe #{@list[params:sexe]} , cette personne aime #{@interests[0]}, #{@interests[1]} et #{@interests[2]}, le cadeau sera offert à l’occasion de #{@list[params:occasions]}, mon budget se situe entre #{@list[params:budget_min]} et #{@list[params:budget_max]}. Je veux que le résultat soit intégré dans un array."}]
    # })
    # @content = chaptgpt_response["choices"][0]["message"]["content"]

    # c'est ici que j'effectue mon custominterestprompt, pseudo code :
    # creer un mini
    # formulaire dans la view, récupéerer l'input value et l'intégrer dans le piluleprompt
  end

  # Affiche de la list
  def show
    @list = Event.list.first(5) #ici il faudra agir sur @content
    # c'est ici que j'effectue mon postprompt, je dois trouver un moyen de poursuivre le premier prompt, ou alors le réitérer et ajouter l'input user au nouveau prompt, déplacer tout cela dans l'edit ou l'update
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
    # il faut ajouter des choses dans les strong params, budgetmin, max etc
  end
end
