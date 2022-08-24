class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts

  def user_posts
    posts.order(created_at: :desc).limit(3)
  end
end
