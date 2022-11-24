class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts

  # Name must not be blank.
  validates :name, presence: true

  # PostsCounter must be an integer greater than or equal to zero.
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Method that returns the 3 most recent posts for a given user.
  def three_recent_posts(id)
    Post.where(users_id: id).order(created_at: :desc).limit(3)
  end
end
