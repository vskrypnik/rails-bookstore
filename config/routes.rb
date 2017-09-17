# frozen_string_literal: true

Rails.application.routes.draw do
  get 'shop', to: 'shop#index'

  root 'home#index'

  devise_for :users
end
