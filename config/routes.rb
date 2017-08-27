Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  
  get '/orders' => 'order#index'
  get '/order/new' => 'order#new'
  get '/vendors' => 'vendor#index'
  get '/vendor/:name' => 'vendor#show'
  get '/payment/new' => 'payment#new'
  
end
