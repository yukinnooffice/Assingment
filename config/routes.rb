Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  root 'homes#top'
  resources :users
  resources :books
end
