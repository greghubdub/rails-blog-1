Rails.application.routes.draw do

  resources :posts do
    resources :comments
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  root "posts#index"

  get '/about', to: 'pages#about'

end
