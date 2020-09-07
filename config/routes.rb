Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :items, only: [:index, :new, :create, :edit, :update, :show]
end
