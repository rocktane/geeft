class Event < ApplicationRecord
  belongs_to :user

  OCCASIONS = %w[Noël Anniversaire Saint-Valentin Fêtes\ des\ parents Fête\ des\ grands-mères Pot\ de\ départ
              Crémaillère Baptème Mariage Aïd\ el\ Fitr Bar-Mitzvah Bat-Mitzvah Baby\ shower
              EVJF EVG Remise\ de\ diplôme Juste\ comme\ ça]
  INTERESTS = %w[Musique Sport Nature Art Voyage Lecture Cuisine Technologie Mode Bien-être Cosmétique Humour Cinéma
          Jardinage Jeux-vidéo Langues\ étrangères Astronomie Bricolage Danse Théatre Spectacle Histoire
          Psychologie Développement\ personnel Sptiritualité Astrologie]
  LIENS = %w[Parent Petit·e-ami·e Frère Soeur Enfant Collègue Grand-parent Cousin·e Oncle Tante Beau-parent
          Beau-frère Belle-soeur Neveu Nièce Petit-enfant BFF Ami·e Conjoint·e Connaissance Patron·ne
          Parrain Marraine Filleul·e Professeur·e Moi-même]

  def content
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
                                      model: ENV.fetch["MODEL"],
                                      messages: [{ role: "user", content: "Je veux une liste de trente cadeaux pour #{liens}, cette personne est de sexe #{genre} , cette personne aime #{interests[0]}, #{interests[1]} et #{interests[2]}, le cadeau sera offert à l’occasion de #{occasion}, mon budget se situe entre #{budget_min} et #{budget_max}. Cette personne est susceptible d'être intéressée par #{self.custom_interest} Je veux que le résultat soit intégré dans un array." }]
                                    })
    return chaptgpt_response["choices"][0]["message"]["content"]
  end
end
