# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'home', to: 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  get 'signup', to: 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get 'logout'  => 'sessions#destroy'
  root 'static_pages#home'
  
  resources :users
  resources :account_activations, only: [:edit]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
