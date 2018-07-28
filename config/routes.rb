Rails.application.routes.draw do
   devise_for :users
  # get 'books/index'
  # get 'books/show'
  # get 'books/new'
  # get 'books/edit'
  get 'user/index'
  # get 'user/show'
  # get 'user/new'
  # get 'user/edit'
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :books

  # root 'books#index'

  # devise/sessions#new
  root :to => 'books#top'

  resources :books, only: [:new, :create, :index, :show]

  resource :book, only: [:new, :create, :index, :show, :destroy] do
     resource :favorites, only: [:create, :destry]
     resource :post_comments, only: [:create, :destroy]
  end

   resources :users, only: [:show]
end
