Rails.application.routes.draw do

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #USERS ROUTES
  # get 'users' =>'users#index'
  # get 'users/new'
  # post 'users' => 'users#create'
  resources :users
  #PRODUCTS ROUTES
  # get 'products' =>'products#index'
  # get 'products/new'
  # post 'products' => 'products#create'
  resources :products
  #CATEGORIES ROUTES
  get 'categories/new'
  post 'categories' => 'categories#create'
  #ORDER ROUTES
  get 'orders/new' =>'orders#new'
<<<<<<< HEAD
  get 'orders/myorder'
  post 'orders/myorder' =>'orders#create'
=======
  post 'orders/new' =>'orders#create'
>>>>>>> 781d21461ce9eb80f740040ebdebe52306a69032

end
