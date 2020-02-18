# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'home#index'
  resources :users
  resources :friendships, except: %i[new edit show update destroy]
  resources :posts, only: %i[create destroy index show update edit] do
    resources :likes, only: %i[create destroy]
  end
  resources :comments, only: %i[create destroy update edit] do
    resources :likes, only: %i[create destroy]
  end
end
