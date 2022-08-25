class User < ApplicationRecord
  has_many :comments, foreign_key: 'user_id', class_name: 'Comment'
  has_many :posts, foreign_key: 'user_id', class_name: 'Post'
  has_many :likes, foreign_key: 'user_id', class_name: 'Like'
  validates :name, presence: true

  def user_posts
    posts.where(user_id(:id)).order(created_at: :desc).limit(3)
  end
end
