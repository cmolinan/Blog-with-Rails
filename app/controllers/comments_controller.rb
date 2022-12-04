class CommentsController < ApplicationController
  before_action :set_new, only: [:new] 

  def new
    @user = current_user
    @comment = Comment.new
    # debugger
  end

  def create
    # current_user = User.find_by!(id: params[:user_id])
    @post = Post.find_by!(id: params[:post_id])
    #comment = Comment.new(author: current_user, post: @post, text: params[:comment][:text])
    # debugger
    comment = Comment.new(comment_params)
    comment.author = current_user
    comment.post = @post

    if comment.save
      redirect_to user_posts_url
    else
      redirect_to new_user_post_comment_url
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
