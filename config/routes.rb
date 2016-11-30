Rails.application.routes.draw do
  resources :books
  resources :authors
  resources :libraries
  resources :contacts
  resources :invitations, only: [:index, :create, :destroy, :show]
  post 'login', to: 'sessions#login'
  resources :secrets, only: :index
  resources :users, only: [:index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
