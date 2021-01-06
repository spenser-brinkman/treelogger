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
  get 'select_survey/:id', to: 'trees#select_survey', as: 'select_survey_for_tree'
  get 'species_selection', to: 'trees#species_selection', as: 'species_selection'
  get 'properties/:property_id/trees/species/:species_id', to: 'trees#single_species_index', as: 'properties_trees_of_species'
  get 'properties/:id/tallest_tree', to: 'properties#tallest_tree', as: 'tallest_tree'

end