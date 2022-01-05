Rails.application.routes.draw do
  resources :floors
  resources :departments
  devise_for :users
  resources :employees
  #get 'home/index'
  get 'home/about'
  root 'home#index'
end
