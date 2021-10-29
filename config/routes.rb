Rails.application.routes.draw do

  resources :favorites
  get "/", to: "hospitals#index", as: 'hospitals'
  get '/logout', to: "sessions#destroy_admin", as: 'logout_admin'
  post "/guest_user", to: "sessions#guest_user", as: 'guest_user'
  post "/guest_admin", to: "sessions#guest_admin", as: 'guest_admin'

  resources :comments
  resources :sessions, only: [:new, :create, :show, :destroy]
  resources :users, except: [:destroy, :index]
  resources :blood_banks, only: [:index, :show]
  resources :pharmacies, only: [:index, :show]

  ActiveAdmin.routes(self)
  resources :hospitals
  resources :specialities
  resources :areas
  resources :towns
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
