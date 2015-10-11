Rails.application.routes.draw do

  root 'welcome#index'

  get 'signup', to: 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :photos, only: [:new, :show]
  resources :favorites, only: [:create, :destroy]
  
end
