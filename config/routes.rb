Rails.application.routes.draw do
  get 'books/index'
  get 'books/new'
  get 'books/show'
  get 'books/edit'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
  resources :users
  resource :sessions, only:[:new, :create, :destroy]
  resources :books
  get "panel_reader", to: "users#panel_reader"
  get "panel_author", to: "users#panel_author"
end
