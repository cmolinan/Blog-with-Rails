class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  belongs_to :post, foreign_key: 'posts_id'

  # method that updates the likes counter for a post.
  def update_likes_counter(post_id)
    new_counter = Post.find_by(id: post_id).likes_counter + 1
    Post.where(id: post_id).update(likes_counter: new_counter)
  end
end
