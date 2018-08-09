Rails.application.routes.draw do
  root 'home#index'
  resources :things
  resources :comments
end
