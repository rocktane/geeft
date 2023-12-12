class Event < ApplicationRecord
  belongs_to :user

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
