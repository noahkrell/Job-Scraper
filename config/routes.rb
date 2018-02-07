Rails.application.routes.draw do
  root 'homepage#index'
  get '/jobs' => 'joblist#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users

end
