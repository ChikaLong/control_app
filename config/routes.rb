Rails.application.routes.draw do
  root 'homes#top'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users
  resources :foods, except:[:new]
  resources :items, except:[:new]

  # 検索用のルーティング
  get "/food_category_search" => "searches#food_category_search"
  get "/item_category_search" => "searches#item_category_search"
end
