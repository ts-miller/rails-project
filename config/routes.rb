Rails.application.routes.draw do
  root 'home#home'
  
  resources :pledges
  resources :creators
  resources :users, only: [:show, :edit, :delete, :update, :create]

  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#delete'

  get '/auth/:provider/callback', to: 'callbacks#google'
  get '/auth/failure', to: redirect('/')
end
