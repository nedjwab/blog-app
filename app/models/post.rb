class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  validates :title, presence: true, length: { maximum: 250 }

  after_save :update_counter

  def five_recent_comments
    comments.includes(:post).order(created_at: :desc).limit(5)
  end

  private

  def update_counter
    user.update(PostsCounter: user.posts.count)
  end
end
