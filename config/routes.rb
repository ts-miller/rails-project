Rails.application.routes.draw do
  root 'home#index'
  
  resources :pledges
  resources :creators
  resources :users

  get '/login', to: 'session#new'
  get '/signup', to: 'users#new'
  get '/logout', to: 'session#delete'
end
