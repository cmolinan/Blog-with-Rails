class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :likes

  # Title must not be blank and must not exceed 250 characters.
  validates :title, presence: true, length: { minimum: 1, maximum: 250 }

  # CommentsCounter must be an integer greater than or equal to zero
  # LikesCounter must be an integer greater than or equal to zero.
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter
  after_destroy :decrement_posts_counter

  def update_post_counter
    author.increment!(:posts_counter)
  end

  # method that decrements the posts counter when a post it's deleted
  def decrement_posts_counter
    author.decrement!(:posts_counter)
  end
  
  # method which returns the 5 most recent comments for a given post.
  def five_recent_comments(_post_num)
    comments.order(updated_at: :desc).limit(5)
  end
end
