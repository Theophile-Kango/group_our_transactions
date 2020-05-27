Rails.application.routes.draw do


  get 'pages/profile'
  delete 'remove_group_trans', to: 'group_transactions#destroy'
  get 'all_external_transactions', to: 'transactions#external_transactions'
  get 'signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'pages/profile', to: 'pages#profile', as: 'profile'
  resources :users, only: [:new, :create]
  resources :groups
  resources :sessions, only: [:new, :create, :destroy]
  resources :transactions
  resources :group_transactions
  resources :users, only: [:new, :create, :edit, :update]
  root to: 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
