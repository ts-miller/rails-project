Rails.application.routes.draw do
  root 'home#home'
  
  resources :pledges
  resources :creators, only: [:new, :create, :update, :destroy, :edit, :show]
  resources :users, only: [:new, :create, :update, :destroy, :edit, :show]
  resources :tiers, only: [:new, :create, :update, :destroy, :edit]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'callbacks#google'
  get '/auth/failure', to: redirect('/')
end