# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  # devise_scope :user do
  #   get 'signup', to: 'users/registrations#new', as: :new_user_registration
  #   post 'signup', to: 'users/registrations#create', as: :user_registration
  #   get 'app/account', to: 'users/registrations#edit', as: :edit_user_registration
  #   patch 'app/account', to: 'users/registrations#update', as: :update_user_registration
  # end

  devise_for :users, path: '', path_names: { sign_in: 'login' },
                     controllers: { sessions: 'users/sessions', passwords: 'users/passwords' }
end
