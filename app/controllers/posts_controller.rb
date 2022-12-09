class PostsController < ApplicationController
  before_action :set_vars, only: %i[show index new]

  def index; end

  def show; end

  def new
    @new_post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.author = User.find_by!(id: params[:user_id])
    # debugger
    if post.save
      redirect_to user_posts_url, notice: 'Post created !'
    else
      redirect_to new_user_post_url, alert: 'Error: post not created'
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:success] = 'Post deleted !'
    else
      flash[:error] = 'Error: Post not deleted'
    end
    redirect_to user_posts_url
  end

  private

  Post.where(author: self).order(id: :asc).limit(3)
  def set_vars
    @user = User.find_by!(id: params[:user_id]) if params[:user_id]
    @posts = Post.includes([:author]).where(user_id: params[:user_id]).order(updated_at: :desc) if params[:user_id]
    @post = Post.find_by!(id: params[:id], user_id: params[:user_id]) if params[:id] && params[:user_id]
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
