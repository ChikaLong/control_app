Rails.application.routes.draw do
  root 'homes#top'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users
  resources :foods
  resources :food_categories, only: [:new, :create]
end
