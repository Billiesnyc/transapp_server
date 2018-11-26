Rails.application.routes.draw do
  resources :reviews
  resources :users
  resources :businesses

  post 'login', to: 'users#login'
  post 'signup', to: 'users#signup'
  get 'validate', to: 'users#validate'
  get 'cities', to: 'businesses#cities'
  get 'categories', to: 'businesses#categories'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
