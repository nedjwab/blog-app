Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/users/:id', to: 'users#show'
  get '/users/', to: 'users#index'
  get '/users/:id/posts/', to: 'posts#index'
  get '/users/:id/posts/:id', to: 'posts#show'
end
