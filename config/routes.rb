Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  
  get '/orders' => 'order#index'

  get '/order/new' => 'order#new'
  post '/order/new' => 'order#create'

  get '/vendors' => 'vendor#index'
  get '/vendor/:name' => 'vendor#show'
  get '/payment/new/:from/:to' => 'payment#new', as: :payment_new
  post '/payment/new/' => 'payment#create'

  
end
