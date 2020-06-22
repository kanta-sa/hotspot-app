class UsersController < ApplicationController
  before_action :set_target_user
  
  def show
    counts(@user)
    @posts = @user.posts.page(params[:page]).per(9)
    @favo_posts = @user.favorite_of_posts.page(params[:page]).per(15)
  end
  
  def followings
    @followings = @user.followings.page(params[:page])
  end
  
  def followers
    @followers = @user.followers.page(params[:page])
  end
  
  private
  
  def set_target_user
    @user = User.find(params[:id])
  end
end
