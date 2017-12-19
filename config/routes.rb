Rails.application.routes.draw do
  root 'sessions#login'
  get 'sessions/login'
  post 'sessions/login_attempt'
  get 'sessions/home'
  get 'sessions/profile'
  get 'sessions/setting'
  post 'sessions/logout'

  get 'users/new'
  get 'shopping_cart' => 'shopping_cart#index'
  get "/" => "shopping_cart#index"
  post "/" => "shopping_cart#handlePost"
  post "shopping_cart" => "shopping_cart#handlePost"
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
