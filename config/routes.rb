Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :comments, only: %i[new create]
  resources :likes, only: [:create]
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create]
  end
end
