Rails.application.routes.draw do

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
  resources :users
  resource :sessions, only:[:new, :create, :destroy]
  resources :books do 
    resources :reviews, only:[:create, :edit, :destroy, :update] do
      resources :likes, shallow: true, only: [:create, :destroy]

      get :liked, on: :collection
    end
  end
  get "panel_reader", to: "users#panel_reader"
  get "panel_author", to: "users#panel_author"
end
