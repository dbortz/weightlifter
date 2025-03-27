require 'devise'

Rails.application.routes.draw do
  devise_for :users
  
  # Setup route for first admin
  get 'setup' => 'setup#new', as: :setup
  post 'setup' => 'setup#create'
  
  # Main sections
  resources :recipes, only: [:index]
  get 'settings' => 'settings#index', as: :settings
  get 'admin' => 'admin#index', as: :admin

  # Admin namespace
  namespace :admin do
    resources :users, only: [:create, :destroy] do
      collection do
        post :bulk_delete
      end
    end
  end
  
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
