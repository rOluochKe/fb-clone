# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'home#index'
  resources :posts, only: %i[create destroy index show update edit] do
    resources :likes, only: %i[create destroy]
  end
  resources :comments, only: [:create, :destroy, :update, :edit] do
    resources :likes, only: %i[create destroy]
  end
end
