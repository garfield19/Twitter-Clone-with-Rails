Rails.application.routes.draw do
  root "pages#index"

  get '/home' => 'pages#home'

  get '/hub' => 'pages#hub'

  get '/explore' => 'pages#explore'
  #get 'control/index'
  

  #get "demo/index"
  match ':controller(/:action(/:id))', :via => :get

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
