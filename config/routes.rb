Rails.application.routes.draw do
  devise_for :users
  root to: 'events#new'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :events

  get "events/:id/event", to: "events#saveandshowdashboard", as: :addinginfobeforesave

  get "events/:id/dashboard", to: "events#showdashboard", as: :dashboard

  patch "events/:id/dashboard", to: "events#update_from_edit_event", as: :update_from_edit_event
end
