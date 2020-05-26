Rails.application.routes.draw do

  get 'pages/profile'
  
  get 'all_transactions', to: 'pages#all_my_transactions'
  get 'all_external_transactions', to: 'pages#all_my_external_transactions'
  get 'all_groups', to: 'pages#all_groups'
  get 'signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'pages/profile', to: 'pages#profile', as: 'profile'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :transactions
  root to: 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
