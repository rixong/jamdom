Rails.application.routes.draw do
  resources :genres
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'users/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
