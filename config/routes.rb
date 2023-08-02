Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts
  root to: "pages#home"
  get '/index', to: 'pages#index'
  get '/about', to: "pages#about"
  get '/category/:id/posts', to: 'posts#show_by_category', as: 'posts_by_category'
end
