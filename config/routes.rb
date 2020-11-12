Rails.application.routes.draw do
  root 'creators#index'
  
  resources :creators, only: [:new, :create, :update, :destroy, :edit, :show] do
    resources :tiers, only: [:new, :index, :edit]
    resources :pledges, only: [:new, :index]
  end

  resources :users, only: [:new, :create, :update, :destroy, :edit, :show] do
    resources :pledges, only: [:index,]
  end

  resources :tiers, only: [:create, :update, :destroy]
  resources :pledges, only: [:create, :update, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'callbacks#google'
  get '/auth/failure', to: redirect('/')

  get '/tiers/most_expensive_9', to: 'tiers#show'

end