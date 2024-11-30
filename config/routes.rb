# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  get 'tanks/new'
  get 'tanks/create'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'
  get 'signup', to: 'email_signup#show'
  post 'signup', to: 'email_signup#create'
  get 'users/profile', to: 'users#profile'
  resources :users
  resources :tanks do
    resources :parameters, module: :tanks
    resources :equipments, module: :tanks
    resources :heaters, module: :tanks
    resources :lights, module: :tanks
  end
  resources :user_tanks, only: [:index]
  get 'up', to: proc { [200, {}, ['OK']] }
end
