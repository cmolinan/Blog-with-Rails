class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, foreign_key: 'post_id'

  # method that updates the likes counter for a post (using increment!)
  def update_likes_counter(post_id)
    Post.find_by(id: post_id).increment!(:likes_counter)
  end
end
