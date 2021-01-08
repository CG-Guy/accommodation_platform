Rails.application.routes.draw do
  

  resources :users
  # resources :listings
  # resources :sub_listings
  resources :invoices
  # resources :register_as_host

  # devise_for :users, controllers: {
  #   sessions:'users/sessions',
  #   registrations: 'users/registrations'
  # }, path: ''
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign-up' }

  get 'home/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :listings do
    patch 'reviews', to: 'reviews#update'
    resources :reviews
    resources :sub_listings, path: 'sub_listings' do
      post 'rating', to: 'sub_listings#rating', as: 'rating'
      post 'review', to: 'sub_listings#review', as: 'review'
    end
  end

  namespace :admin do
    resources :main_settings
  end

  
  resources :faq
  
  # get '/user' => "events#index", :as => :user_root
  get 'my_listing',to: 'listings#my_listings'
  get 'province',to: 'countries#province'
  get 'city',to: 'countries#city'
  root 'home#index'
  post 'site-files', to: 'site_files#upload', as: 'site_files'
  

  get 'reservation', to: 'reservation#index'
  get 'about', to: 'about#index'
  get 'faq', to: 'faq#index'
  get 'profile', to: 'profile#show'
  get 'profile/edit', to: 'profile#edit'
  put 'profile', to: 'profile#update'
  get 'account', to: 'account#index'
end
