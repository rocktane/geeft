Rails.application.routes.draw do
  devise_for :users
  root to: 'events#new'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :events

  get "users/:user_id/events/:id", to: "pages#save", as: "savingevent"

  get "users/:user_id/dashboard", to: "pages#savetodashboard", as: "savingeventtodashboard"

end
