Rails.application.routes.draw do
  root 'homepage#index'
  get '/jobs' => 'joblist#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  post '/save' => 'votes#create'
  
  resources :users

end
