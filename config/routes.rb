Rails.application.routes.draw do
  resources :sub_listings
  resources :invoices
  resources :register_as_host
  devise_for :users
  get 'home/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :listings do
    resources :sub_listings, path: 'sub_listings' do
      post 'rating', to: 'sub_listings#rating', as: 'rating'
    end
  end

  namespace :admin do
    resources :main_settings
  end

  root 'home#index'
end
