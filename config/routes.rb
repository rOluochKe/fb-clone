# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  resources :friendships, only: %i[index create update destroy unfriend]
  delete 'friendship', to: 'friendships#unfriend'
  get 'privacy', to: 'privacy#index'
  get 'terms', to: 'terms#index'
  # Post Routes
  resources :posts, only: %i[create destroy index show update edit] do
    resources :likes, only: %i[create destroy]
  end

  # Comments routes
  resources :comments, only: %i[create destroy update edit] do
    resources :likes, only: %i[create destroy]
  end

  authenticated :user do
    root 'posts#index'
  end

  devise_scope :user do
    root to: 'devise/sessions#new', as: :sign_up_root
  end
end
