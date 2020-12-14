Rails.application.routes.draw do
  root 'books#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update] do
  resources :books, only: [:new, :create, :index, :show, :destroy]
  end
  resources :users, only: [:show]
end
