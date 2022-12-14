class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, foreign_key: 'post_id'

  after_save :update_comments_counter
  after_destroy :decrement_comments_counter

  # method that updates the comments counter for a post (using increment!)
  def update_comments_counter
    post.increment!(:comments_counter)
  end

  # method that decrements the comments counter when a comment is deleted
  def decrement_comments_counter
    post.decrement!(:comments_counter)
  end
end
