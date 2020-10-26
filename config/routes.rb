Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
}
  get 'homes/about'
  resources :users,only: [:show,:edit,:update]
  resources :inquities,only: [:new, :create]
  resources :genres
  resources :events do
    collection do
      get :search
    end
  	resources :event_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
