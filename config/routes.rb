Rails.application.routes.draw do

  root to: 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'auth/:provider/callback', to: 'sessions#googleAuth', as: 'google_login'
  get 'logout', to: 'sessions#destroy'
  get 'auth/failure', to: redirect('/')
  
  resources :properties do
    resources :surveys, shallow: true do
      resources :trees, shallow: true
    end
  end
  
  resources :surveys, only: [:show, :edit, :update, :destroy]

  get 'delete_property', to: 'properties#delete_property_confirmation', as: 'delete_property'
  get 'choose_property_to_survey', to: 'surveys#choose_property_to_survey', as: 'start_new_survey'
  # resources :tree_surveys
  # resources :properties
  resources :users
  # resources :trees

end