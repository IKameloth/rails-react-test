Rails.application.routes.draw do
  root 'react#home'

  get '/api/places', to: 'api/places#index'
end
