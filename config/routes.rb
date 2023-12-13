Rails.application.routes.draw do
  devise_for :users
  root to: 'events#new'


  # root to: 'devise/sessions#create'
  # authenticated :user do
  #   root to: 'events#new'
  # end


  get "up" => "rails/health#show", as: :rails_health_check

  resources :events
end
