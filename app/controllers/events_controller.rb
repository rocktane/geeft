class EventsController < ApplicationController
  OCCASIONS = %w[Noël Anniversaire Saint-Valentin Fêtes\des\parents Fête\des\grands-mères Pot\de\départ Crémaillère
                 Baptème Mariage Aïd\el\Fitr Bar-Mitzvah Bat-Mitzvah Baby\shower Enterrement\de\vie\de\jeune\fille
                 Enterrement\de\vie\de\garçon Remise\de\diplôme Juste\comme\ça...]
  INTERETS = %w[Musique Sport Nature Art Voyage Lecture Cuisine Technologie Mode Bien-être Cosmétique Humour Cinéma
                Jardinage Jeux-vidéo Langues\étrangères Astronomie Bricolage Danse Théatre Spectacle Histoire
                Psychologie Développement\personnel Sptiritualité Astrologie]
  LIENS = %w[Parent Petit.e-Ami.e Frère\ou\Soeur Enfant Collègue Grand-parent Cousin.e Oncle\ou\Tante Beau-parent
             Beau-frère\ou\Belle-soeur Neveu\ou\Nièce Petit-enfant BFF Ami.e Conjoint.e Connaissance Patron.ne
             Parrain\ou\Marraine Filleul.e Professeur.e Moi-même]

  # Page d'acceuil
  def home
  end

  # Affichage des critères
  def new
    @event = Event.new
    @occasions = OCCASIONS
    @interests = INTERETS # peut-être mettre les interests dans un array
    @liens = LIENS
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to event_path(@event)
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
    params.require(:event).permit(:list, :event_name, :event_date, :event_url, :cagnotte_url)
    # il faut ajouter des choses dans les strong params, budgetmin, max etc, custom_interest
  end
end
