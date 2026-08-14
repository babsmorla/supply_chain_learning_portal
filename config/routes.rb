Rails.application.routes.draw do
  resources :supply_requests, only: [ :index, :new, :create, :show ] do
    member do
      patch :approve
    end
  end

  root "supply_requests#index"
end
