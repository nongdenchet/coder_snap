Rails.application.routes.draw do
  root 'home#index'

  # authentication, authorization
  resource :sessions, only: [:create, :new, :destroy]
  resources :users, only: [:create, :new]
end
