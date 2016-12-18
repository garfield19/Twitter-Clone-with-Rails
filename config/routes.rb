Rails.application.routes.draw do
  devise_for :users
  resources :updates
  root "pages#home"

  get '/home' => 'pages#home'

  get '/user/:id' => 'pages#hub'

  get '/explore' => 'pages#explore'
  #get 'control/index'
  

  #get "demo/index"
  match ':controller(/:action(/:id))', :via => :get

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
