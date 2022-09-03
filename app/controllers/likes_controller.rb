class LikesController < ApplicationController
  def add_like
    @user = current_user
    @post = Post.find(params[:id])
    @like = @post.likes.new
    @like.post_id = @post.id
    @like.user_id = @user.id
    @like.save
    redirect_to user_post_path(@post.user, @post)
  end
end
