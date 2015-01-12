Rails.application.routes.draw do
  resources :certifications

  resources :move_types

  resources :moves

  mount Upmin::Engine => '/admin'

  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_scope :user do
    authenticated :user do
      root :to => 'visitors#index'
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :users
end
