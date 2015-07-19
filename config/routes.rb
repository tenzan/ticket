Rails.application.routes.draw do
  devise_for :users
  root 'clients#index'
  
  resources :clients do
    resources :tickets
  end
end
