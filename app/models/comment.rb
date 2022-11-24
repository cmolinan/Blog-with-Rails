class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  belongs_to :post, foreign_key: 'posts_id'

  # method that updates the comments counter for a post (using increment!)
  def update_comments_counter(post_id)
    Post.find_by(id: post_id).increment!(:comments_counter)
  end
end