Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  get 'about', to: 'pages#about'
  get 'root', to: 'pages#index'
  get '/login', to: 'pages#index'
  post '/login', to: 'pages#index'

  resources :articles do
    resources :comments, only: :create
    resource :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
