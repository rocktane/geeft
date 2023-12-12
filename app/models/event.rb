class Event < ApplicationRecord
  belongs_to :user_id

  def content
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
                                      model: ENV.fetch["MODEL"],
                                      messages: [{ role: "user", content: "Je veux une liste de trente cadeaux pour #{subject}, cette personne est de sexe #{genre} , cette personne aime #{interests[0]}, #{interests[1]} et #{interests[2]}, le cadeau sera offert à l’occasion de #{occasion}, mon budget se situe entre #{budget_min} et #{budget_max}. Je veux que le résultat soit intégré dans un array." }]
                                    })
    return chaptgpt_response["choices"][0]["message"]["content"]
  end
end
