Rails.application.routes.draw do
  resources :rooms do
    resources :reviews, only: [:create, :destroy]
  end
  devise_for :users
  root 'rooms#index'
end
