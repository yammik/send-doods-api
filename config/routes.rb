Rails.application.routes.draw do
  # get '/login', to: 'sessions#new', as: 'login'
  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :games, only: [:index, :create]
  resources :drawings, only: [:create]

  mount ActionCable.server => '/cable'
end
