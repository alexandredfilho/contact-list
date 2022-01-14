Rails.application.routes.draw do
  resources :floors
  resources :departments
  devise_for :users
  resources :employees
  root 'home#index'
end
