class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
