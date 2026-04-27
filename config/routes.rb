Rails.application.routes.draw do
  resources :devices
  namespace :api do
    resources :energy_readings, only: [:index, :create]
  end
end
