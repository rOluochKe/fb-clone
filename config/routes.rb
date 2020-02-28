# frozen_string_literal: true

Rails.application.routes.draw do
<<<<<<< HEAD
  get 'privacy/index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
=======
  devise_for :users, controllers: {  :omniauth_callbacks => 'users/omniauth_callbacks',registrations: 'users/registrations' }
>>>>>>> 90f05d58a252165f4aaa28221ab7064c4e6e9c1d
  root to: 'home#index'
  resources :users
  resources :friendships, only: %i[index create update destroy unfriend]
  delete 'friendship', to: 'friendships#unfriend'
  get 'privacy', to: 'privacy#index'
  # Post Routes
  resources :posts, only: %i[create destroy index show update edit] do
    resources :likes, only: %i[create destroy]
  end

  # Comments routes
  resources :comments, only: %i[create destroy update edit] do
    resources :likes, only: %i[create destroy]
  end
end
