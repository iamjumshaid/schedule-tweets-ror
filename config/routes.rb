Rails.application.routes.draw do
  #get "about", to: 'about#index'
  get 'about-us', to: 'about#index', as: :about

  get 'signup', to: 'registrations#new'
  post 'signup', to: 'registrations#create'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'

  get 'password', to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#create', as: :update_password 
  
  get 'password/reset/edit', to: 'password_resets#reset'
  patch 'password/reset', to: 'password_resets#edit'

  get 'reset/password', to: 'password_resets#new'
  post 'reset/password', to: 'password_resets#create'

  delete 'logout', to: 'sessions#destroy'
  root to: 'main#index'
end 

