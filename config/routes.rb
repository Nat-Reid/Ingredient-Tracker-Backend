Rails.application.routes.draw do
  resources :user_ingredients, only: [:create, :index]
  # resources :ingredients
  # resources :recipes
  resources :users, only: [:create]
  post '/login', to: 'auth#login'
  get '/profile', to: 'users#profile'
  get '/find-ingredients/:ingredient_name', to: 'ingredients#find'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
