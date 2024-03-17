Rails.application.routes.draw do
  resources :adopters
  resources :adoptions
  resources :cats, only: %i[index show]
  resources :pages, only: %i[show]
  resources :services, only: %i[index]

  # Admin routes
  namespace :admin do
    resources :cats
    resources :dashboards, only: %i[index]
    resources :pages
    resources :photo_sets
    resources :services
    resources :users
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # root url routes
  get "welcome/index"
  get "welcome/contact", as: :contact
  root to: "welcome#index"
end
