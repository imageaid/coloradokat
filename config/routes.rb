Rails.application.routes.draw do
  resources :photo_sets
  resources :adoptions
  resources :cats, only: %i[index show]
  resources :adopters
  resources :pages, only: %i[show]
  resources :users

  # Admin routes
  namespace :admin do
    resources :pages
    resources :cats
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # root url routes
  get "welcome/index"
  get "welcome/contact", as: :contact
  root to: "welcome#index"
end
