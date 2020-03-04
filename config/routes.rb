Rails.application.routes.draw do

  resources :genres
  resources :jams
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  
  resources :users
  post 'users/instrument_search', to:'users#instrument_search', as: 'instruments'
  get 'users/instrument_results/:id', to:'users#instrument_results', as: 'results'

  root 'users#show'

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
