class Event < ApplicationRecord
  belongs_to :user_id

  OCCASIONS = %w[Noël Anniversaire Saint-Valentin Fêtes\ des\ parents Fête\ des\ grands-mères Pot\ de\ départ
    Crémaillère Baptème Mariage Aïd\ el\ Fitr Bar-Mitzvah Bat-Mitzvah Baby\ shower
    Enterrement\ de\ vie\ de\ jeune\ fille Enterrement\ de\ vie\ de\ garçon Remise\ de\ diplôme
    Juste\ comme\ ça]
  LISTS = %w[Musique Sport Nature Art Voyage Lecture Cuisine Technologie Mode Bien-être Cosmétique Humour Cinéma
  Jardinage Jeux-vidéo Langues\ étrangères Astronomie Bricolage Danse Théatre Spectacle Histoire
  Psychologie Développement\ personnel Sptiritualité Astrologie]
  LIENS = %w[Parent Petit.e-Ami.e Frère\ ou\ Soeur Enfant Collègue Grand-parent Cousin.e Oncle\ ou\ Tante Beau-parent
  Beau-frère\ ou\ Belle-soeur Neveu\ ou\ Nièce Petit-enfant BFF Ami.e Conjoint.e Connaissance Patron.ne
  Parrain\ ou\ Marraine Filleul.e Professeur.e Moi-même]
end
