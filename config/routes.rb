Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "locations#index"
  resources :locations
  get "/favorites", to:"favorites#index"
  post "/favorites/:location_id", to:"favorites#create"

end