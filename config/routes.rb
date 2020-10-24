Rails.application.routes.draw do
  root 'top#index'
  
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:show, :edit, :update] do
    get :follow, on: :member
  end
  
  resources :posts, shallow: true do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :reviews, only: [:index, :create]
    collection do
      get :cities_select
      get :favorites
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :notifications, only: :index
end
