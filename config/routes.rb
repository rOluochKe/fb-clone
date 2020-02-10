# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :posts
  resources :comments
  resources :posts do
    resources :likes
  end
  resources :comments do
    resources :likes
  end
end
