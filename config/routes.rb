Rails.application.routes.draw do
  resources :projects
  devise_for :users
 
namespace :admin do
  resources :user_roles, only: [:index, :edit, :update]
end



devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
