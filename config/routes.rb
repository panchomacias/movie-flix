Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  root "movies#index"

  resources :movies do
    resources :reviews
  end

  resources :users

  get "signup" => "users#new", :as => :signup

  resource :session, only: %i[new create destroy]
  get "signin" => "sessions#new"
end
