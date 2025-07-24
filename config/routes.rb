Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  root "initial_page#index"

  resources :searches, only [:index, :create]
end
