Rails.application.routes.draw do

  get 'top' => 'root#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'


  resources :books, only: [:new, :create, :index, :edit, :destroy, :update, :show]
  resources :users, only: [:show, :edit, :index, :update]
end
