Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'

  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles, only: [:show, :index, :new, :create]

end
