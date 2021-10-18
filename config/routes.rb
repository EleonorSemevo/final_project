Rails.application.routes.draw do
  resources :hospitals
  resources :specialities
  resources :areas
  resources :towns
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
