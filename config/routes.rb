Rails.application.routes.draw do
  resources :attendees
  resources :invitees

  devise_for :users
  devise_scope :user do
    delete "/logout" => "devise/sessions#destroy"
  end
  resources :companies
  resources :events
  resources :rooms
  resources :buildings
  resources :sites
  resources :invitees
  get '/admin' => 'dashboard#index'
  get '/users' => 'users#index'
  get '/pdf' => 'events#reports', as: 'pdf'
  get '/events_csv' => 'events#reports', as: 'events_csv'
  get '/company/rooms' => 'companies#mount_building_relation'
  get '/userdash' => 'dashusers#index'
  root 'dashusers#index'

end
