Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/countries' => 'countries#index'

  root 'countries#index'

  get '/states' => 'states#index'

  post '/states' => 'states#create'
  post '/countries' => 'countries#create'
end
