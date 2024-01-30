# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    resources :categories
    get 'dashboard/index'
    resources :services do
      member do
        put :update_status
      end
      get ':status', action: :index, on: :collection, as: :filter, constraints: { status: /(new|approved|rejected)/ }
    end
  end

  namespace :seller do
    get 'dashboard/index'
    resources :services
  end
  devise_for :users, path: '', path_names: { sign_in: 'login' },
                     controllers: { sessions: 'users/sessions', passwords: 'users/passwords' }
end
