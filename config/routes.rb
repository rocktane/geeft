Rails.application.routes.draw do
  devise_for :users
  root to: 'events#new'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :events

  get "save", to: "pages#save"

end
