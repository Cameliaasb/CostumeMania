Rails.application.routes.draw do
  resources :monuments
  devise_for :users
  root to: "pages#home"
  get "/show", to: "pages#show"
  # root to: "costumes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
