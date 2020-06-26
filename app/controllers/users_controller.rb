class UsersController < ApplicationController
  before_action :set_target_user
  before_action :authenticate_user!
  
  def show
    counts(@user)
    @posts = @user.posts.page(params[:page]).per(9)
    @favo_posts = @user.favorite_of_posts.page(params[:page]).per(9)
  end
  
  def follow
    @followings = @user.followings
    @followers = @user.followers
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now[:alert] = '変更できませんでした'
      render :edit
    end
  end
  
  private
  
  def set_target_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:image, :username)
  end
end
