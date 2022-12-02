class PostsController < ApplicationController
  def index    
    @user = User.find_by!(id: params[:user_id])
    @posts = Post.where(user_id: params[:user_id])
  end

  def show
    @user = User.find_by!(id: params[:user_id])
    @post = Post.find_by!(id: params[:id], user_id: params[:user_id])
  end

  def new
    @user = User.find_by!(id: params[:user_id])
    @new_post = Post.new    
  end

  def create
    current_user = User.find_by!(id: params[:user_id])
    post = Post.new(author: current_user, title: params[:post][:title], text: params[:post][:text] )  

    if post.save      
      redirect_to user_posts_url
    else
      redirect_to  new_user_post_url
    end
  end
  
end
