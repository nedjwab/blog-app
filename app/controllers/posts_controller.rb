class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:user).find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @user = current_user
    @post = @user.posts.new
    @params = params
  end

  def create
    @post = current_user.posts.new(user_id: current_user.id, title: params[:post][:title], text: params[:post][:text])
    @post.LikesCounter = 0
    @post.CommentCounter = 0
    if @post.save
      redirect_to user_posts_path(id: @post.id, user_id: @post.user_id)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.user), notice: "Successfully deleted the post #{@post.title}."
  end
end
