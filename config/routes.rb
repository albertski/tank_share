# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get 'signup', to: 'email_signup#show'
  post 'signup', to: 'email_signup#create'
end
