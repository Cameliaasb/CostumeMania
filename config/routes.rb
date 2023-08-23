Rails.application.routes.draw do
  devise_for :users
  root to: "costumes#index"
  resources :costumes, only: %i[index show new create]
  # root to: "costumes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/my_collection', to: 'costumes#my_collection'
end
