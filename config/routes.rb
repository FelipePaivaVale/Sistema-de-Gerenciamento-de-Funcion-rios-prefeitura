Rails.application.routes.draw do
  get 'admin/new_user'
  get 'admin/create_user'
  root 'home#index'
  devise_for :users, controllers: {
    passwords: 'passwords',
    sessions: 'sessions'
    }
  devise_scope :user do
    
    patch 'users/update_password', to: 'users/registrations#update_password', as: :update_user_password
  end
  get 'admin/new_user', to: 'admin#new_user', as: 'new_admin_user'
  post 'admin/create_user', to: 'admin#create_user', as: 'create_admin_user'
  
  resources :cargos
  resources :departamentos
  resources :funcionarios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
