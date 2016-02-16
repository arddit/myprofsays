Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :professors
  root to: "application#index"
end
