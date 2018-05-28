Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

    root to: 'toppages#index'
    get 'tasklist', to: 'toppages#index'
  resources :toppages, only: [:index]
  
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    
  resources :tasks
  
    get 'signup', to: 'users#new'
  resources :users
end
