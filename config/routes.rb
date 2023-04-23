Rails.application.routes.draw do
  devise_for :authors
  get 'statics/contact'
  get 'statics/our'
  get 'statics/other'
  get 'home/index'
  resources :authors
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get '*path' => redirect('/')
end
