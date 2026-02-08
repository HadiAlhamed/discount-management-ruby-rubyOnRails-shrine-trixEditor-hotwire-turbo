Rails.application.routes.draw do
  root "discounts#index"
  resources :discounts, only: [:index, :create]

  # Requirement #44: API Namespace
  namespace :api do
    namespace :partners do
      resources :discounts, only: [:index]
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
end