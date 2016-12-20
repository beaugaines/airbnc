Rails.application.routes.draw do
  resources :rooms do
    resources :reviews, only: [:create, :destroy]
  end
  get '/users/show/:id', to: 'users#show', as: :user
  devise_for :users
  get 'search' => 'searches#index', as: :search
  root 'rooms#index'
end
