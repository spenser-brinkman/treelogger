Rails.application.routes.draw do

  root to: 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'auth/google_oauth2/callback', to: 'sessions#googleAuth', as: 'google_login'
  get 'logout', to: 'sessions#destroy'
  get 'auth/failure', to: redirect('/')
  
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
  get 'choose_property_to_survey', to: 'surveys#choose_property_to_survey', as: 'start_new_survey'
  # resources :inspections
  # resources :properties
  resources :users
  # resources :trees

end