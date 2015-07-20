Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'

    resources :clients, only: [:new, :create, :destroy]
  end

  devise_for :users
  root 'clients#index'

  resources :clients, only: [:index, :show, :edit, :update] do
    resources :tickets
  end
end
