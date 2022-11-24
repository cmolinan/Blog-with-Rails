class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  has_many :comments
  has_many :likes

  # method that updates the posts counter for a user.
  def update_post_counter(user)
    new_counter = User.find_by(name: user).posts_counter + 1
    User.where(name: user).update(posts_counter: new_counter)
  end

  # method which returns the 5 most recent comments for a given post.
  def five_recent_comments(post_num)
    Comment.where(posts_id: post_num).order(created_at: :desc).limit(5)
  end
end
