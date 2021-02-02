Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'images#index'

  post '/images', to: 'images#save'
  get '/images', to: 'images#index'
  delete '/images', to: 'images#delete'
end
