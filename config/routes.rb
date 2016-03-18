Rails.application.routes.draw do
  root 'home#index'

  resource :sessions, only: [:create, :new, :destroy]
  resources :relations, only: [:create, :index] do
    member do
      post :confirm
    end
  end
  resources :users , only: [:create, :index, :new]
  resources :messages, only: [:index, :new, :create, :show] do
    collection do
      get :sent
    end

    member do
      get :detail
    end
  end
end
