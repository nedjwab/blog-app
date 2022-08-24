class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  private

  def update_comments_counter
    post.update(CommentCounter: post.comments.count)
  end
end
