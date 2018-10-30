Rails.application.routes.draw do
  resources :tasks
  resources :lists
  root 'home#index'
  devise_for :users, controllers: 
  {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticated :user do
    root to: 'home#index', as: :authenticated_root_path
  end
  root to: redirect('/users/sign_in')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
