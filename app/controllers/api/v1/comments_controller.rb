class Api::V1::CommentsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    comment = Comment.find(params[:id])
    render json: comment
  end

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    render json: comment, status: 'Created' if comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
