class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    counts(@user)
  end
end
