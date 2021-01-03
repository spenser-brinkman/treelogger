Rails.application.routes.draw do
  
  root to: 'sessions#welcome'
  
  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'auth/google_oauth2/callback', to: 'sessions#googleAuth', as: 'google_login'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy'
  
  resources :properties do
    resources :trees, shallow: true do
      resources :inspections, shallow: true
    end
    resources :surveys, shallow: true do
      resources :inspections, shallow: true
    end
  end
  
  resources :trees, only: [:show, :edit, :update, :destroy]
  resources :surveys, only: [:show, :edit, :update, :destroy]

  get 'delete_property', to: 'properties#delete_property_confirmation', as: 'delete_property'
  get 'delete_survey', to: 'surveys#delete_survey_confirmation', as: 'delete_survey'
  get 'delete_user', to: 'users#delete_user_confirmation', as: 'delete_user'
  get 'new_survey', to: 'surveys#new_survey', as: 'start_new_survey'

end