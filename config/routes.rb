Rails.application.routes.draw do
  root 'clients#index'
  
  resources :clients
end
