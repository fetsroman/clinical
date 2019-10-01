Rails.application.routes.draw do
  resources :categories
  resources :users
  resources :addresses

  post '/login', to: 'authentication#login'
  post '/logout', to: 'authentication#logout'
end
