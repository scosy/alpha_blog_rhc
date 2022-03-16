Rails.application.routes.draw do
  resources :comments
  resources :users, excepet: [:new]
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about", to: "pages#about"
  get 'signup', to: 'users#new'
  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
end
