Rails.application.routes.draw do
  resources :savings_goals
  resources :pocket_money
  resources :users, only: [:create]

  post '/login', to: 'sessions#create'
  post '/register', to: 'users#create'
end
