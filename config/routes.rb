Rails.application.routes.draw do

  resources :genres
  resources :users
  resources :jams

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  root 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
