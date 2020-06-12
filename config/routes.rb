Rails.application.routes.draw do
  get 'users/:id', to: "users#show"
  root 'top#index'
  
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  
end
