Rails.application.routes.draw do
  root 'top#index'
  
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }
  resources :users, only: [:show, :edit, :update] do 
    member do 
      get :follow
    end
  end
  resources :relationships, only: [:create, :destroy]
  
  resources :posts, shallow: true do
    collection do
      get :cities_select
    end
    resource :favorites, only: [:create, :destroy]
    get :favorites, on: :collection
    resources :comments, only: [:create, :destroy]
  end
  
  resources :notifications, only: :index
end
