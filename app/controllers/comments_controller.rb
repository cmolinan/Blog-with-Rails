class CommentsController < ApplicationController
  before_action :set_new, only: [:new]

  def new
    @user = current_user
    @comment = Comment.new
  end

  def create
    @post = Post.find_by!(id: params[:post_id])
    @user = User.find_by!(id: params[:user_id])
    comment = Comment.new(comment_params)
    comment.author = current_user
    comment.post = @post

    if comment.save      
      # redirect_to user_posts_url, notice: 'Comment created !'
      redirect_to user_post_url(@user, @post), notice: 'Comment created !'
    else
      redirect_to new_user_post_comment_url, alert: 'Error: comment not created !'
    end
  end

  private

  def set_new
    @post = Post.find_by!(id: params[:post_id])
    @user = User.find_by!(id: params[:user_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
