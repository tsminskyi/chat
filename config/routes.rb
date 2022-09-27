Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#creat'
  delete 'logout', to: 'sessions#destroy'

  root 'chatroom#index'
end
