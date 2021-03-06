# # Rails.application.routes.draw do
# #   root to: 'users#index'
# #   devise_for :users

# #   get '/users/', to: 'users#index'
# #   get '/users/:id/', to: 'users#show'

# #   get '/posts/new', to: 'posts#new'
# #   get '/users/:id/posts/', to: 'posts#index'
# #   get '/users/:id/posts/:id/', to: 'posts#show'

# #   post '/posts', to: 'posts#create'
# #   post '/users/:user_id/posts/:id/comments', to: 'comments#create'
# #   post '/users/:user_id/posts/:id/likes', to: 'likes#create'
# # end

# Rails.application.routes.draw do
#   devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' } # rubocop:disable Layout/LineLength

#   devise_scope :user do
#     get '/sign_out', to: 'users/sessions#destroy'
#   end

#   resources :users, only: %i[index show] do
#     resources :posts, only: %i[index show new create] do
#       resources :comments, only: [:create]
#       resources :likes, only: [:create]
#     end
#   end

#   namespace :api, :defaults => {:format => :json} do
#     resources :users, only: [:index, :show] do
#       resources :posts, only: [:index, :show] do
#         resources :comments, only: [:index, :create]
#       end
#     end
#   end
#   root 'users#index'
# end

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  get '/users/', to: 'users#index'
  get '/users/:id/', to: 'users#show'

  get '/posts/new', to: 'posts#new'
  get '/users/:user_id/posts/', to: 'posts#index'
  get '/users/:user_id/posts/:id/', to: 'posts#show'

  post '/posts', to: 'posts#create'
  post '/users/:user_id/posts/:id/comments', to: 'comments#create'
  post '/users/:user_id/posts/:id/likes', to: 'likes#create'
  delete '/users/:user_id/posts/:id', to: 'posts#destroy'
  delete '/users/:user_id/posts/:post_id/comments/:id', to: 'comments#destroy'

  namespace :api, defaults: { format: :json } do
    resources :users, only: %i[index show] do
      resources :posts, only: %i[index show] do
        resources :comments, only: %i[index create]
      end
    end
  end
end
