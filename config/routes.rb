# frozen_string_literal: true

# Configuration for the routes of the app
require 'sidekiq/web'
Rails.application.routes.draw do
  # Adding the resources
  resources :tasks
  resources :lists
  devise_for :users, controllers:
  {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Index page when loading the server
  root 'home#index'
  # Redirection when the user signs in
  authenticated :user do
    root to: 'home#index', as: :authenticated_root_path
  end
  root to: redirect('/users/sign_in')
  # Sidekiq configuration
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
