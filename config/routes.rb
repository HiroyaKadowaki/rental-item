Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'categories#index'
  resources :categories, only: [:index, :new, :create, :show, :edit, :update]
  resources :items do
    resources :rentals, only: [:index, :create, :destroy]
  end
  resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  resources :users, only: [:show]
end
