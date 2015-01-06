Rails.application.routes.draw do
  resources :certifications

  resources :move_types

  resources :moves

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
