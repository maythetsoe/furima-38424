Rails.application.routes.draw do
  devise_for :users
  get 'users/index', to: 'users#index'
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show]
end
