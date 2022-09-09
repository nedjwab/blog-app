Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy]
    resources :comments, only: %i[new create]
    resources :likes, only: %i[create destroy]
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
          resources :likes
        end
      end
    end
  end
end
