class PostsController < ApplicationController
  require 'net/http'
  require 'json'
  require 'uri'
  
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @search = Post.ransack(params[:q])
    @posts = @search.result.includes(:prefecture).page(params[:page]).per(9).order('updated_at DESC')
    @random = Post.order("RAND()").limit(4)
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.page(params[:page]).per(10).order('updated_at DESC')
    @comment = @post.comments.build
  end

  def new
    if user_signed_in?
      @post = Post.new
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
  
  def inn_api
    @post = Post.find_by(id: params[:id])
    @prefecture = Prefecture.find_by(id: @post.prefecture_id).name
    @city = City.find_by(id: @post.city_id).name
    data = {
      "applicationId": "1089094225319416329",
      "format": "json",
      "keyword": @city,
      "middleClassName": @Prefecture
    }
    query = data.to_query
    uri = URI("https://app.rakuten.co.jp/services/api/Travel/KeywordHotelSearch/20170426?" + query)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    req = Net::HTTP::Get.new(uri)
    res_data = https.request(req)
    hash = JSON.parse(res_data.body)
    @inns = hash["hotels"]
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name, :information, :image, :prefecture_id, :city_id)
  end
  
  def post_search_params
    params.fetch(:search, {}).permit(:prefecture_id)
  end
  
end
