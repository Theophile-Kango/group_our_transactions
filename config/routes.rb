Rails.application.routes.draw do

  delete 'remove_transaction', to: 'group_transactions#destroy'
  get 'external_teachers', to: 'transactions#external_transactions'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'profile', to: 'pages#profile', as: 'profile'
  get 'teachers', to: 'transactions#index'
  get 'teacher/new', to: 'transactions#new'
  get 'teacher', to: 'transactions#show'
  get 'edit/teacher', to: 'transactions#edit'
  get 'courses', to: 'groups#index'
  get 'course/new', to: 'groups#new'

  resources :groups
  resources :sessions, only: [:new, :create, :destroy]
  resources :transactions
  resources :group_transactions, only: [:create, :destroy]
  resources :users, only: [:new, :create, :edit, :update]
  
  root to: 'pages#index'
  get '*path', to: 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
