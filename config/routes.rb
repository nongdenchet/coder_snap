Rails.application.routes.draw do
  root 'home#index'

  resource :sessions, only: [:create, :new, :destroy]
  resources :messages, only: [:index, :new, :create, :show] do
    collection do
      get :sent
    end
  end
  resources :users , only: [:create, :index, :new]
end
