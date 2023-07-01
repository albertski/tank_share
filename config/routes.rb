# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'
  get 'signup', to: 'email_signup#show'
  post 'signup', to: 'email_signup#create'
end
