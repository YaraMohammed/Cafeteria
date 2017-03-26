Rails.application.routes.draw do

  get 'sessions/new'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #USERS ROUTES
  # get 'users' =>'users#index'
  # get 'users/new'
  # post 'users' => 'users#create'
  resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
  #PRODUCTS ROUTES
  # get 'products' =>'products#index'
  # get 'products/new'
  # post 'products' => 'products#create'
  resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
  post 'products/changestatus' =>'products#changestatus'
  #CATEGORIES ROUTES
  get 'categories/new'
  post 'categories' => 'categories#create'
  #ORDER ROUTES
  get 'orders/new' =>'orders#new'
  get 'orders/myorder'
  #post 'orders/myorder' =>'orders#list'
  post 'orders/new' =>'orders#create'
  get 'orders' =>'orders#list'
  post 'orders/deliver' =>'orders#deliver'
  #SESSION ROUTES
  resources :sessions, only: [:new, :create, :destroy]
  #login and logout
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
root :to => "sessions#new"
end
