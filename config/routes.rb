Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
 
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do 
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      post 'users/login' => 'users#login'
      post 'users/signup' => 'users#signup'
      get  'users/:user_id/posts' => 'posts#users_posts'
      get  'users/:user_id/posts/:post_id/comments' => 'posts#list_comments'
      post 'users/posts/:post_id/addcomment' => 'posts#add_comment'
      resources :users, only: [:index, :show]
    end
  end

end
