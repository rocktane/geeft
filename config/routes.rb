Rails.application.routes.draw do
  devise_for :users
  root to: 'events#new'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :events

  get "profile", to: "pages#show"

end
