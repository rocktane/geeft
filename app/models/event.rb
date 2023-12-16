class Event < ApplicationRecord
  belongs_to :user
  attr_reader :new_subject

  OCCASIONS = %w[Noël Anniversaire Saint-Valentin Fêtes\ des\ parents Fête\ des\ grands-mères Pot\ de\ départ
              Crémaillère Baptème Mariage Aïd\ el\ Fitr Bar-Mitzvah Bat-Mitzvah Baby\ shower
              EVJF EVG Remise\ de\ diplôme Juste\ comme\ ça]
  INTERESTS = %w[Musique Sport Nature Art Voyage Lecture Cuisine Technologie Mode Bien-être Cosmétique Humour Cinéma
              Jardinage Jeux-vidéo Langues\ étrangères Astronomie Bricolage Danse Théatre Spectacle Histoire
              Psychologie Développement\ personnel Sptiritualité Astrologie]
  LIENS = %w[Parent Petit·e-ami·e Frère Soeur Enfant Collègue Grand-parent Cousin·e Oncle Tante Beau-parent
          Beau-frère Belle-soeur Neveu Nièce Petit-enfant BFF Ami·e Conjoint·e Connaissance Patron·ne
          Parrain Marraine Filleul·e Professeur·e Moi-même]

          # CLIENT = OpenAI::Client.new

  def content(client, lien, subject, budget_min, budget_max, genre, occasion, age, _id, _user_id)
    chaptgpt_response = client.chat(
      parameters: {
        model: ENV["MODEL"],
        messages: [
          {
            role: "user",
            content: "Je veux une liste de trente cadeaux pour #{lien}, cette personne est de sexe #{genre}, cette personne est âgée de #{age} ans, cette personne aime #{subject.join(', ')}, le cadeau sera offert à l’occasion de #{occasion}, mon budget se situe entre #{budget_min} euros et #{budget_max} euros. Je veux que le résultat soit intégré dans une liste numérotée."
          }
        ]
      }
    )
    chaptgpt_response["choices"][0]["message"]["content"]
  end

  def update_content(post_prompt, client)
    chaptgpt_response = client.chat(
      parameters: {
        model: ENV["MODEL"],
        messages: [
          {
            role: "user",
            content: "A partir de la liste générée(#{list}), je t'avais demandé une liste de trente cadeaux pour #{lien} qui est âgée de #{age} ans et est de sexe #{genre}.Ce cadeau sera offert à l'occasion de #{occasion}, je t'avais précisé que cette personne aime #{subject.join(', ')}. Je veux que tu prennes en compte ce commentaire: #{post_prompt} et que tu me donnes une nouvelle liste numérotée. Ta réponse ne doit inclure rien d'autre que cette nouvelle liste numérotée."
          }
        ]
      }
    )
    return chaptgpt_response["choices"][0]["message"]["content"]
  end
end
