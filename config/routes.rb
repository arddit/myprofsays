Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :professors
  resources :posts
  root to: "application#index"
end
