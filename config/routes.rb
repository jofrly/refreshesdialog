Rails.application.routes.draw do
  root "customers#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :customers, only: [:index, :new, :create, :edit, :update, :destroy]
end
