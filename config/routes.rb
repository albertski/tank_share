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
  get 'users/profile', to: 'users/profile#profile'
  put 'users/profile', to: 'users/profile#profile_update'
  resources :users, only: %i[edit update]
  resources :tanks do
    resources :parameters, module: :tanks
    resources :equipments, module: :tanks
    resources :heaters, module: :tanks
    resources :lights, module: :tanks
    resources :pumps, module: :tanks
    resources :livestocks, module: :tanks
    resources :fish, module: :tanks
    resources :corals, module: :tanks
    resources :invertebrates, module: :tanks
    delete 'remove_image/:image_id', to: 'tanks#remove_image', as: 'remove_image'
  end
  resources :user_tanks, only: [:index]
  get 'up', to: proc { [200, {}, ['OK']] }
end
