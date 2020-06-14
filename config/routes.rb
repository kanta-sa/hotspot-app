Rails.application.routes.draw do
  
  root 'top#index'
  
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }
  resources :users, only: [:show]
  resources :posts
end
