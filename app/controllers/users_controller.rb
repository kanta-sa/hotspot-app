class UsersController < ApplicationController
  before_action :set_target_user
  before_action :authenticate_user!
  before_action :forbid_guest_user, only: [:edit, :update]
  
  def show
    counts(@user)
    @posts = @user.posts.page(params[:page]).per(12).order('updated_at DESC')
    @favo_posts = @user.favorite_of_posts.page(params[:page]).per(12).order('updated_at DESC')
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
  
    def forbid_guest_user
      return unless @user.email == 'guest@example.com'
  
      flash[:notice] = 'ゲストユーザーのため変更できません'
      redirect_to user_path(@user)
    end
end
