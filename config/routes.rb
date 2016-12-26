Rails.application.routes.draw do
  devise_for :users , controllers: { confirmations: 'confirmations' }
  resources :relationships
  resources :users do
    member do
      get :following, :followers
      end 
    end
   resources :updates
   resources :messages do
      resources :comments
    end
   get '/messages' => 'messages#index'

  root "pages#index"
  get '/home/hashtags/',         to: 'hashtags#index',     as: :hashtags
get '/hashtags/:hashtag', to: 'hashtags#show',      as: :hashtag

  get '/home' => 'pages#home'

  get '/user/:id' => 'pages#hub'

  get '/explore' => 'pages#explore'
  #get 'control/index'
  

  #get "demo/index"
  match ':controller(/:action(/:id))', :via => :get

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
