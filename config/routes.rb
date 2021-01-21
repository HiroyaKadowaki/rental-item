Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :categories, only: [:create, :new]
  resources :items do
    resources :rentals, only: [:index, :create, :destroy]
  end
  resources :users, only: [:show]
end
