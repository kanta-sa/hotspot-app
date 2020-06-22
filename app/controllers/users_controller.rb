class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    counts(@user)
    @posts = @user.posts.page(params[:page]).per(9)
    @favo_posts = @user.favorite_of_posts.page(params[:page]).per(15)
  end
end
