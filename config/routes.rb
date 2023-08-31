Rails.application.routes.draw do
  devise_for :admin, controllers: {
	  sessions: 'admin/sessions'
  }
  
  devise_for :users, controllers: {
	  sessions: 'users/sessions'
  }
  
  root 'pages#home'
  
  get 'pages/users'
  get 'pages/admin'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
