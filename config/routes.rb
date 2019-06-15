Rails.application.routes.draw do
	
  get 'top' => 'root#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'

  post'books' => 'books#create'
  
  resources :books, only: [:new, :create, :index, :show]


end
