Rails.application.routes.draw do
  
  
  # Application
  # @implemented 
  root to: 'dashboard/home#index'

  # Dashboard
  # @implemented
  namespace :dashboard do
    get '', to: 'home#index'
  	resources :tasks 
    resources :profile, only: [:index, :show, :edit, :update]
  end

  # Application
  # @implemented
  devise_for :users

  # API 
  # @implemented
  namespace :api, constraint: { subdomain: 'api' } do 
    namespace :v1 do 
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
