Rails.application.routes.draw do
  devise_for :users
  resources :homes
  resources :articles
  root 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
