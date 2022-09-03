class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:id])
    @like = @post.likes.new
    @like.post_id = @post.id
    @like.user_id = @user.id
    @like.save
    redirect_to user_posts_path(id: @like.post_id, user_id: @like.user_id) if @like.save
  end
end
