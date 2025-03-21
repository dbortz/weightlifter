Rails.application.routes.draw do
  root "home#index"
  
  # Health check endpoint for Render
  get "up" => "rails/health#show", as: :rails_health_check
end 