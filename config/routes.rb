# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'
  get 'signup', to: 'email_signup#show'
  post 'signup', to: 'email_signup#create'
  get 'users/profile', to: 'users#profile'
  resources :users
  get 'up', to: proc { [200, {}, ['OK']] }
end
