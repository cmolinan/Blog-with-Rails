class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments
  has_many :likes
  has_many :posts

  # Name must not be blank.
  validates :name, presence: true

  # PostsCounter must be an integer greater than or equal to zero.
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # User::Roles
  # The available roles
  Roles = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end

  # Method that returns the 3 most recent posts
  def three_recent_posts
    posts.order(updated_at: :desc).limit(3)
  end
end
