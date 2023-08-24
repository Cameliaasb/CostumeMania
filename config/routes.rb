Rails.application.routes.draw do
  devise_for :users

  root to: "costumes#index"

  resources :costumes, only: %i[index show new create edit update destroy] do
    resources :bookings, only: %i[new create]

  end

  # root to: "costumes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/my_costumes', to: 'costumes#my_costumes'
  get '/my_bookings', to: 'bookings#my_bookings'
end
