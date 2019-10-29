Rails.application.routes.draw do
  scope '/api' do
    resources :line_items, only: [:create, :update, :destroy]
    resources :carts, only: [:index]
    resources :addresses, only: [:index]
    resources :items, only: [:index, :show]
    resources :categories, only: [:index, :show]
    resources :banners, only: [:index]

    get '/current_user', to: "users#user"

    post '/sign_in', to: 'authentication#sign_in'
    post '/sign_out', to: 'authentication#sign_out'
    post '/refresh_token', to: 'application#refresh_token'

    post '/card_payment', to: 'payment#card_payment'
    post '/non_cash_payment', to: 'payment#non_cash_payment'

    namespace :admin do
      resources :users do
        member do
          put '/generate_password', to: 'users#generate_password'
        end
      end
      resources :addresses, only: [:destroy]
      resources :items
      resources :categories
      resources :banners, only: [:index, :update]
      resources :banner_parameters, only: [:destroy]
      resources :options, only: [:destroy]

      post '/sign_in', to: 'authentication#sign_in'
      post '/sign_out', to: 'authentication#sign_out'
    end
  end
end
