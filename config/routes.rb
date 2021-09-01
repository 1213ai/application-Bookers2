Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:show, :index, :edit, :update, :destroy, :create]
end