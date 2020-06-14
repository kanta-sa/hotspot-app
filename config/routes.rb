Rails.application.routes.draw do
  
  
  get 'favorites/create'
  get 'favorites/destroy'
  root 'top#index'
  
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }
  resources :users, only: [:show] do 
    member do 
      get :followings
      get :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  
  resources :posts, shallow: true do
    resource :favorites, only: [:create, :destroy]
    get :favorites, on: :collection
  end
end
