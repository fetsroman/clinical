Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :users
  resources :addresses

  post '/login', to: 'authentication#login'
  post '/logout', to: 'authentication#logout'

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :items
    resources :categories
  end

  namespace :admins do
    resources :users
    resources :addresses

    post '/login', to: 'authentication#login'
    post '/logout', to: 'authentication#logout'

    scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
      resources :items
      resources :categories
    end
  end
end
