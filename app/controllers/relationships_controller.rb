class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:follow_id])
    current_user.follow(@user)
  end

  def destroy
    @user = User.find(params[:follow_id])
    current_user.unfollow(@user)
  end
end
