Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#creat'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  resources :users, except: [:new]
  resources :messages
  root 'chatroom#index'
end
