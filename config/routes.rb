Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :destroy]
  get '/login', to: 'users#login', as: 'login'
  post '/authenticate', to: 'application#authenticate'
  root 'events#index'

  resources :events, only: [:index, :new, :create, :show]
  post 'events/:id/attend', to: 'events#attend', as: 'attend'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
