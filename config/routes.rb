# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'home/all_services', to: 'home#all_services', as: 'all_services'
  get 'home/show/:id', to: 'home#show', as: :service
  get 'home/book_service/:id', to: 'home#book_service', as: :home_book_service
  post '/payments/create', to: 'payments#create', as: 'payments_create'
  get '/categories/:category_id/services', to: 'services#index', as: 'category_services'

  namespace :customer do
    get 'dashboard/index'
    resources :bookings, only: %i[index new create]
    resources :reviews, only: %i[index create new]
  end

  namespace :admin do
    resources :categories
    get 'dashboard/index'
    resources :services, only: %i[index show update]
  end

  namespace :seller do
    get 'dashboard/index'
    resources :bookings, only: %i[index edit update]
    resources :services do
      member do
        patch 'reapprove'
      end
    end
  end
  devise_for :users, path: '', path_names: { sign_in: 'login' },
                     controllers: { sessions: 'users/sessions', passwords: 'users/passwords' }
end
