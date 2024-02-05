Rails.application.routes.draw do
  namespace :admin do
    resources :posts
    resources :users, except: [:show]
    resources :roles
  end
  resources :posts, only: [:index, :show]
  get 'user_sessions/new'
  get 'user_sessions/create'
  resources :sessions, only: [:new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "posts#index"
end
