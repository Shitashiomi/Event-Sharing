Rails.application.routes.draw do
  resources :events
  root 'homes#top'
  devise_for :users
  get 'homes/about'
  resources :users,only: [:show,:edit,:update]
  resources :inquities,only: [:new, :create]
  resources :genres
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
