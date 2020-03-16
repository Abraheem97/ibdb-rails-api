Rails.application.routes.draw do 
  mount RailsAdmin::Engine => '/sadmin', as: 'rails_admin'
  devise_for :users , controllers: { confirmations: 'confirmations' }

  resources :books do 
    resources :reviews, except: [:show]
    resources :comments, except: [:show]
  
end

scope :auth do
  get 'is_signed_in', to: 'auth#is_signed_in?'
end

  root 'books#index'
  get 'books/:id/author', controller: 'books', action: 'show_author', as: 'show_author'
  
namespace :v1 do 
  resources :sessions, only: [:create,:destroy]
  get 'users', controller: 'users', action: 'index'
end
  mount ActionCable.server => '/cable'
end
