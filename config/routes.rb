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
  resources :invitees
  get '/admin' => 'dashboard#index'
  get '/users' => 'users#index'
  get '/pdf' => 'events#index', as: 'pdf'
  get '/events_csv' => 'events#index', as: 'events_csv'
  get '/rsvp' => 'application#rsvp'
  root 'companies#index'

end
