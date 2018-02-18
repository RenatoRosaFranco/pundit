Rails.application.routes.draw do
  
  namespace :dashboard do
    resources :tasks
  end
  # Dashboard
  # @implemented
  namespace :dashboard do
    get '', to: 'home#index'
  	resources :tasks 
  	resources :users do 
  	  resources :task
  	end
  end

  # Application
  # @implemented
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
