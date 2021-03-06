Rails.application.routes.draw do
  root 'home#index'

  get 'auth/:provider/callback' => 'sessions#callback'
  resource :sessions, only: [:create, :new, :destroy]

  resources :relations, only: [:create, :index] do
    member do
      post :confirm
    end
  end

  resources :users, only: [:create, :index, :new, :edit, :update] do
    collection do
      get :blocks
      get :friends
    end

    member do
      post :block
      post :unblock
      post :unfriend
    end
  end

  resources :messages, only: [:index, :new, :create, :show] do
    collection do
      get :sent
    end

    member do
      get :detail
    end
  end
end
