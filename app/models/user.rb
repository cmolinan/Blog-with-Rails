class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts

  # Method that returns the 3 most recent posts for a given user.
  def three_recent_posts(id)
    Post.where(users_id: id).order(created_at: :desc).limit(3)
  end
end
