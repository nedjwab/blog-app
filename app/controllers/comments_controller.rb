class CommentsController < ApplicationController
  def add_comment
    @user = current_user
    @post = Post.find(params[:user_id])
    @comment = current_user.comments.new(text: params[:comment])
    @comment.post_id = @post.id
    @comment.save
    redirect_to user_post_url(@user, @post)
  end
end
