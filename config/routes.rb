Rails.application.routes.draw do
  require 'sidekiq/web'
  
  # Application
  # @implemented 
  root to: 'dashboard/home#index'

  # Dashboard
  # @implemented
  namespace :dashboard do
    get '', to: 'home#index'
  	resources :tasks do 
       resources :comments, only: [:create, :destroy]
    end
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

  # Sidekiq => only admin
  # @implemented
  authenticate :user, lambda { |user| user.admin? } do 
     mount Sidekiq::Web => '/sidekiq'
  end 
end
