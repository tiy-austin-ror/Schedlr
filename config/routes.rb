Rails.application.routes.draw do
  devise_for :users
  resources :companies
  resources :events
  resources :rooms
  resources :buildings
  resources :sites


   root 'companies#index'

end
