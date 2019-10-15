Rails.application.routes.draw do
  scope '/api' do
    resources :line_items
    resources :carts, only: [:index]
    resources :users, only: [:show]
    resources :addresses, only: [:index]
    resources :items, only: [:index, :show]
    resources :categories, only: [:index, :show]
    resources :banners

    post '/sign_in', to: 'authentication#sign_in'
    post '/sign_out', to: 'authentication#sign_out'
    post '/refresh_token', to: 'application#refresh_token'

    post '/card_payment', to: 'payment#card_payment'
    post '/non_cash_payment', to: 'payment#non_cash_payment'

    namespace :admin do
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
