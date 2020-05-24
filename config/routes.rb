Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'pages/profile', to: 'pages#profile', as: 'profile'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
