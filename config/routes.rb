# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'
  }
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
