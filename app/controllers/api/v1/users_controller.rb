class API::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  def index
    @users = Users.all
  end

  def show
    @posts = @user.posts
  end

  def set_user
    @user = User.find(params[:id])
  end
end
4
