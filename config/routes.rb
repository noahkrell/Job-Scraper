Rails.application.routes.draw do
  root 'homepage#index'
  get '/jobs' => 'joblist#index'
  get '/signup', to: 'users#new'
  resources :users

end
