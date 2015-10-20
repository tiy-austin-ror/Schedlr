Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    delete "/logout" => "devise/sessions#destroy"
  end
  resources :companies
  resources :events
  resources :rooms
  resources :buildings
  resources :sites
  get '/admin' => 'dashboard#index'
  get '/users' => 'users#index'
  root 'companies#index'
end
