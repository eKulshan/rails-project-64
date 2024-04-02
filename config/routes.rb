# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  devise_for :users

  root 'posts#index'

  resources :posts, only: %w[index new show create] do
    resources :comments, only: :create
  end
end
