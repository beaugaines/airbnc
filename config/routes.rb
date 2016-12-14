Rails.application.routes.draw do
  resources :rooms do
    resources :reviews, only: [:create, :destroy]
  end
  get '/users/show/:id', to: 'users#show', as: :user
  devise_for :users
  root 'rooms#index'
end
