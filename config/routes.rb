Rails.application.routes.draw do
  root 'users#new'
  resources :tasks
  namespace :admin do
    resources :users
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only:[:new,:show,:create,:edit,:update,:destroy]
end
