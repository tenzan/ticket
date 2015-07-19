Rails.application.routes.draw do
  root 'clients#index'
  
  resources :clients do
    resources :tickets
  end
end
