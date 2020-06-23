class PostsController < ApplicationController
  
  def index
    @search = Post.ransack(params[:q])
    @posts = @search.result.includes(:prefecture).page(params[:page]).per(9).order('updated_at DESC')
    @random = Post.order("RAND()").limit(4)
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def new
    if user_signed_in?
      @post = Post.new(flash[:post])
    end
  end
  
  def cities_select
    render partial: 'cities', locals: { prefecture_id: params[:prefecture_id] } if request.xhr?
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
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name, :information, :image, :prefecture_id, :city_id)
  end
  
  def post_search_params
    params.fetch(:search, {}).permit(:prefecture_id)
  end
  
end
