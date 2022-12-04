class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :likes

  # Title must not be blank and must not exceed 250 characters.
  validates :title, presence: true, length: { minimum: 1, maximum: 250 }

  # CommentsCounter must be an integer greater than or equal to zero
  # LikesCounter must be an integer greater than or equal to zero.
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # method that updates the posts counter for a user.
  # def update_post_counter(user)
  #   new_counter = User.find_by(name: user).posts_counter + 1
  #   User.where(name: user).update(posts_counter: new_counter)
  # end

  after_save :update_post_counter

  def update_post_counter
    author.increment!(:posts_counter)
  end

  # method which returns the 5 most recent comments for a given post.
  def five_recent_comments(post_num)
    Comment.where(post_id: post_num).order(updated_at: :desc).limit(5)
  end
end
