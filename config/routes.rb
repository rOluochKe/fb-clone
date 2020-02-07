# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users, only: %i[index show]

  root to: 'home#index'
  get 'home/index'
end
