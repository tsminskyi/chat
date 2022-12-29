Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#creat'
  delete 'logout', to: 'sessions#destroy'
  # post 'messages', to: 'messages#creat'

  resources :messages
  root 'chatroom#index'
  # mount ActionCable.server, at: '/cable'
end
