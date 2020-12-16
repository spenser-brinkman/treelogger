Rails.application.routes.draw do
  # resources :tree_surveys
  # resources :properties
  # resources :users
  # resources :surveys
  # resources :trees
  root to: 'welcome#landing'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post] 
end
