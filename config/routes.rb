Rails.application.routes.draw do
  resources :monuments
  devise_for :users
  root to: "pages#home"
  get "/show", to: "pages#show"
  resources :costumes, only: %i[index show new create]
  # root to: "costumes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/my_collection', to: 'costumes#my_collection'
end
