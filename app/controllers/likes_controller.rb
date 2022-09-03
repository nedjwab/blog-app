class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    redirect_to user_posts_path(id: @like.post_id, user_id: @like.user_id) if @like.save
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end