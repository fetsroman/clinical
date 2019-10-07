Rails.application.routes.draw do
  resources :line_items
  resources :carts, only: [:index]
  resources :users, only: [:show]
  resources :items, only: [:index, :show]
  resources :categories, only: [:index, :show]

  post '/login', to: 'authentication#login'
  post '/logout', to: 'authentication#logout'

  post '/card_payment', to: 'payment#card_payment'

  namespace :admins do
    resources :users
    resources :addresses
    resources :items
    resources :categories

    post '/login', to: 'authentication#login'
    post '/logout', to: 'authentication#logout'
  end
end
