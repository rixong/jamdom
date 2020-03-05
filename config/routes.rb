Rails.application.routes.draw do

  resources :genres
  resources :jams
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  
  
  get '/jams/:id/requests', to: 'jams#request_index'
  post '/jams/:id/requests', to: 'jams#accept_request'
  delete '/jams/:id/requests', to: 'jams#decline_request'
  post '/jams/index', to: 'jams#send_request'





  resources :users
  post '/users/index', to: 'users#send_invite'
  post 'users/instrument_search', to:'users#instrument_search', as: 'instruments'
  get 'users/instrument_results/:id', to:'users#instrument_results', as: 'results'
  post 'users/accept_invite', to: 'users#accept_invite'
  post 'users/decline_invite', to: 'users#decline_invite'

  root 'users#show'

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
