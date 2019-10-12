Rails.application.routes.draw do
  scope '/api' do
    resources :line_items
    resources :carts, only: [:index]
    resources :users, only: [:show]
    resources :items, only: [:index, :show]
    resources :categories, only: [:index, :show]
    resources :banners

    post '/sign_in', to: 'authentication#sign_in'
    post '/sign_out', to: 'authentication#sign_out'

    post '/card_payment', to: 'payment#card_payment'

    namespace :admins do
      resources :users
      resources :addresses
      resources :items
      resources :categories
      resources :banners

      post '/sign_in', to: 'authentication#sign_in'
      post '/sign_out', to: 'authentication#sign_out'
    end
  end
end
