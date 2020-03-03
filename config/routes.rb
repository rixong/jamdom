Rails.application.routes.draw do

  resources :genres
  resources :users
  resources :jams

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  
  get '/jams/:id/requests', to: 'jams#request_index'
  post '/jams/:id/requests', to: 'jams#accept_request'
  delete '/jams/:id/requests', to: 'jams#decline_request'
  post '/users/index', to: 'users#send_invite'
  post '/jams/index', to: 'jams#send_request'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
