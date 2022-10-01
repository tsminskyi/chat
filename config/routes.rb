Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#creat'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#creat'

  root 'chatroom#index'
end
