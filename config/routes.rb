Rails.application.routes.draw do
  root to: "home#index"
  resources :products

  devise_for :users
end
