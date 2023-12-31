Rails.application.routes.draw do
  devise_for :users
  root to: 'events#home'

  get "up" => "rails/health#show", as: :rails_health_check

  post "events/:id/event", to: "events#updatelist", as: :updatelist

  resources :events

  get "events/:id/event", to: "events#saveandshowdashboard", as: :addinginfobeforesave

  get "/dashboard", to: "events#showdashboard", as: :dashboard

  patch "events/:id/dashboard", to: "events#update_from_edit_event", as: :update_from_edit_event

  get "events/:id/share", to: "events#share", as: :share

end
