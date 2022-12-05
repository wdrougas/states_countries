Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'countries#index'

  get '/countries' => 'countries#index'
  get '/states' => 'states#index'
  get '/countries-states' => 'countries#fetch_states'

  post '/states' => 'states#create'
  post '/countries' => 'countries#create'
end
