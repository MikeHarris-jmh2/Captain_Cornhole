Rails.application.routes.draw do
  root to: "home#index"

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

  resources :products

  devise_for :users
end
