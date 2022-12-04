class LikesController < ApplicationController
  def create
    @post = Post.find_by!(id: params[:post_id])
    # current_user = User.find_by!(id: params[:user_id])
    like = Like.create(author: current_user, post: @post)

    redirect_to user_post_likes_url, notice: 'Like created !'
    return unless like.save

    like.update_likes_counter
  end
end
