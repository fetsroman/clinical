Rails.application.routes.draw do
  resources :users
  resources :addresses

  post '/login', to: 'authentication#login'
  post '/logout', to: 'authentication#logout'

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :items
    resources :categories
  end
end
