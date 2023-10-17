# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  devise_for :users, controllers: { registrations: 'registrations' }

  resource :accounts

  get 'activity/mine'
  get 'activity/feed'

  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'activity#mine'
end
