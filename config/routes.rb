Rails.application.routes.draw do

  resources :favorites
  get "/", to: "hospitals#index", as: 'hospitals'
  # put "/comments/favorite/:id", to: "comments#make_favorite", as: 'make_favorites'
  resources :comments
  # get 'sessions/new'
  resources :sessions, only: [:new, :create, :show, :destroy]
  resources :users, except: [:destroy, :index]
  # resources :blood_bank_insurances, only: [:index, :show]
  # resources :hospital_insurances, only: [:index, :show]
  # resources :pharmacy_insurances, only: [:index, :show]
  # resources :insurances, only: [:index, :show]
  # resources :timetables, only: [:index, :show]
  resources :blood_banks, only: [:index, :show]
  resources :pharmacies, only: [:index, :show]

  ActiveAdmin.routes(self)
  resources :hospitals
  resources :specialities
  resources :areas
  resources :towns
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
