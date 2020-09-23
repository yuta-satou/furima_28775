Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :items do
    resources :orders, only: [:new, :create]
    resources :messages, only: :create
  end
end
