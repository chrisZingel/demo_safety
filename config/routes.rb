Rails.application.routes.draw do
  devise_for :users
  resources :videos do
    resources :categories
  end

  resources :organisations
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  match "/start", to: "homes#start", via: :get
  root "homes#start"

end
