Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # get "users" => "users#index"
  # get 'users/:id/edit' => "users#edit"
  # Defines the root path route ("/")
  # root "articles#index"
end
