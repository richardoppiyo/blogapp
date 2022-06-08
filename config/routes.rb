Rails.application.routes.draw do
  get '/users/', to: 'users#index'
  get '/users/:id/', to: 'users#show'

  get '/posts/new', to: 'posts#new'
  get '/users/:id/posts/', to: 'posts#index'
  get '/users/:id/posts/:id/', to: 'posts#show'

  post '/posts', to: 'posts#create'
  post '/users/:user_id/posts/:id/comments', to: 'comments#create'
end
