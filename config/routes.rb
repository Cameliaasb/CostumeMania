Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users

  root to: "pages#home"

  resources :costumes, only: %i[index show new create edit update destroy] do
    resources :bookings, only: %i[new create edit update destroy]
    resources :reviews, only: %i[create]
  end

  # costumes controller
  get '/my_costumes', to: 'costumes#my_costumes'
  get '/wordsearch', to: 'costumes#search'

  # bookings controller
  get '/my_bookings', to: 'bookings#my_bookings'
  get '/costumes/:costume_id/bookings/:id/accept', to: 'bookings#accept', as: "accept"
  get '/costumes/:costume_id/bookings/:id/refuse', to: 'bookings#refuse', as: "refuse"

end
