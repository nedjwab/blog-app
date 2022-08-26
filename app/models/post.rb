class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  validates :title, presence: true, length: { maximum: 250 }
  validates :CommentCounter, :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_counter

  def five_recent_comments
    comments.includes([:user]).order(created_at: :desc).limit(5)
  end

  private

  def update_counter
    author.increment!(:PostsCounter)
  end
end
