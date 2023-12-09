Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'

  root 'pages#home'
  #root 'articles#index'
  get 'about', to: 'pages#about'

  resources :articles

end
