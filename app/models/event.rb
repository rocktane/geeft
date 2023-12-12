class Event < ApplicationRecord
  belongs_to :user

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

  def content
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
                                      model: ENV.fetch["MODEL"],
                                      messages: [{ role: "user", content: "Je veux une liste de trente cadeaux pour #{liens}, cette personne est de sexe #{genre} , cette personne aime #{interests[0]}, #{interests[1]} et #{interests[2]}, le cadeau sera offert à l’occasion de #{occasion}, mon budget se situe entre #{budget_min} et #{budget_max}. Cette personne est susceptible d'être intéressée par #{self.custom_interest} Je veux que le résultat soit intégré dans un array et que les éléments soient séparés par des double quotes." }]
                                    })
    return chaptgpt_response["choices"][0]["message"]["content"]
  end

mettre un hidden field tag avec le client de la premiere requete
mettre un hidden field tag avec le client de la premiere requete
mettre un hidden field tag avec le client de la premiere requete

  def update_content

    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
                                      model: ENV.fetch["MODEL"],
                                      messages: [{ role: "user", content: "A partir de la liste générée, prend en compte ce commentaire: #{form.input.valueofthelistform}" }]
                                    })
    return chaptgpt_response["choices"][0]["message"]["content"]
  end
end
