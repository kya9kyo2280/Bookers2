Rails.application.routes.draw do

  get 'home/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'root#top'


  resources :books, only: [:new, :create, :index, :edit, :destroy, :update, :show]
  resources :users, only: [:show, :edit, :index, :update]
end
