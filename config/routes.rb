Rails.application.routes.draw do
  get 'users/show/:id' => 'members#show', as: :user_show

  resources :rooms do
    resources :reviews, only: [:create, :destroy]
  end
  devise_for :users
  root 'rooms#index'
end
