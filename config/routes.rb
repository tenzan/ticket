Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
  end

  devise_for :users
  root 'clients#index'

  resources :clients do
    resources :tickets
  end
end
