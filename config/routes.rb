Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'home#index'

  get '/about' => 'home#about'

  get '/vendors' => 'vendor#index'
  get '/vendor/:name' => 'vendor#show'

  get '/orders' => 'order#index'

end
