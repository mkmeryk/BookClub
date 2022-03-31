Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
  resources :users
  resource :sessions, only:[:new, :create, :destroy]
  get "panel_reader", to: "users#panel_reader"
  get "panel_author", to: "users#panel_author"
end
