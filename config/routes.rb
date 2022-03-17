Rails.application.routes.draw do
  resources :comments
  
  resources :users, excepet: [:new]
  
  resources :articles
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about", to: "pages#about"
  
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
end
