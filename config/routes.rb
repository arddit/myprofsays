Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :professors
  resources :posts
  post "posts/:id" => "posts#upvote"
  root to: "application#index"
end
