class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
    @params = params
  end

  def create
    @post = current_user.posts.new(user_id: current_user.id, title: params[:post][:title], text: params[:post][:text])
    @post.LikesCounter = 0
    @post.CommentCounter= 0
    if @post.save
      redirect_to user_posts_path(id: @post.id, user_id: @post.user_id)
    else
      render :new
    end
  end

end
