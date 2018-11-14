Rails.application.routes.draw do
  resources :games, only: [:index, :create, :show, :update]
  resources :drawings, only: [:create]
  resources :messages, only: [:index, :create, :show]

  mount ActionCable.server => '/cable'
end
