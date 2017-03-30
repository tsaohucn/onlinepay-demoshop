Rails.application.routes.draw do
  root :to => "products#index"
  resources :products
  #resources :carts

  get 'products/buy/:id' => 'products#buy', as: 'product_buy'
  delete '/carts/:id' => 'carts#destroy', as: 'cart'
  get 'carts/checkout' => 'carts#checkout', as: 'cart_checkout' 
  post 'carts/onlinepay/:id' => 'carts#onlinepay', as: 'cart_onlinepay'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
