Rails.application.routes.draw do
  # resources :tree_surveys
  # resources :properties
  resources :users, except: :new
  # resources :surveys
  # resources :trees
  root to: 'sessions#welcome'
  get 'login', to: 'sessions#new'
  get 'auth/:provider/callback', to: 'sessions#googleAuth', as: 'google_login'
  get 'logout', to: 'sessions#destroy'
  get 'auth/failure', to: redirect('/')
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  get 'users', to: 'users#index'

end