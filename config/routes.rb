Rails.application.routes.draw do
  get 'statics/contact'
  get 'statics/our'
  get 'home/index'
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
