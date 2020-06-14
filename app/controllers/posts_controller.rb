class PostsController < ApplicationController

  def new
    if user_signed_in?
      @post = current_user.posts.build
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿できました"
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "投稿できませんでした"
      render 'posts/new'
    end
  end

  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name, :information, :image)
  end
end
