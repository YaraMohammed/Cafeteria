Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'products' =>'products#index'
  get 'products/new'
  post 'products' => 'products#create'

end
