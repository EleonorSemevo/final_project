Rails.application.routes.draw do
  resources :comments
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :show, :destroy]
  resources :users
  resources :blood_bank_insurances
  resources :hospital_insurances
  resources :pharmacy_insurances
  resources :insurances
  resources :timetables
  resources :blood_banks
  resources :pharmacies
  ActiveAdmin.routes(self)
  resources :hospitals
  resources :specialities
  resources :areas
  resources :towns
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
