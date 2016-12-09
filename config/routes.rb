Rails.application.routes.draw do
  resources :rooms do
    resources :reviews
  end
  devise_for :users
  root 'rooms#index'
end
