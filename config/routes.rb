Rails.application.routes.draw do
  root 'pages#home'
  get '/contact' => 'pages#contact'
  get '/distributors' => 'pages#distributors'
  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles, only: %i[index show]
end
