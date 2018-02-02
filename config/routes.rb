Rails.application.routes.draw do
  root 'homepage#index'
  get '/jobs' => 'joblist#index'
end
