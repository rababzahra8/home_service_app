# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'home/all_services', to: 'home#all_services', as: 'all_services'

  namespace :admin do
    resources :categories
    get 'dashboard/index'
    resources :services, only: %i[index show update]
  end

  namespace :seller do
    get 'dashboard/index'
    resources :services do
      member do
        patch 'reapprove' # Adds a custom route for reapproval
      end
    end
  end
  devise_for :users, path: '', path_names: { sign_in: 'login' },
                     controllers: { sessions: 'users/sessions', passwords: 'users/passwords' }
end
