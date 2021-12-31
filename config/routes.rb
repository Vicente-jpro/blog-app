Rails.application.routes.draw do
  resources :comments
  resources :categories
  get '/userarticle/:id', to: 'userarticle#show', as: 'userarticle'

  devise_for :users
  resources :homes
  resources :articles
  #resources :users
  root 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
