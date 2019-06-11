Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  resources :reviews
  resources :beers
  resources :breweries
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
