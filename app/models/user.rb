class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, foreign_key: 'user_id', class_name: 'Comment'
  has_many :posts, foreign_key: 'user_id', class_name: 'Post'
  has_many :likes, foreign_key: 'user_id', class_name: 'Like'
  validates :name, presence: true
  validates :PostsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def user_posts
    posts.includes(:user).order(created_at: :desc).limit(3)
  end
end
