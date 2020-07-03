Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :show]
  get '/login', to: 'users#login'
  post '/authenticate', to: 'users#authenticate'
  root 'users#index'

  resources :events, only: [:index, :new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
