# frozen_string_literal: true

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  namespace :admin do
    resources :countries
    resources :clubs
    resources :users
    root to: 'countries#index'
  end

  # https://guides.rubyonrails.org/i18n.html
  scope '(:locale)', locale: /en|es/ do
    devise_for :users, controllers: {
      sessions: 'devise/sessions',
      registrations: 'users/registrations'
    }
    resources :clubs
  end

  root to: 'clubs#index'

  # allows mapping at root-level (/en | /es)
  get '/:locale' => 'clubs#index'
end
