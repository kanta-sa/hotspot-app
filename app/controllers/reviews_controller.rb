class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.find(params[:post_id])
    @review = Review.new
    @reviews = @post.reviews
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @post = Post.find(params[:post_id])
    @reviews = @post.reviews
    if @review.save
      @flg = false
      render :review
    else
      @flg = true
      render :review
    end
  end
  
  private
    def review_params
      params.require(:review).permit(:post_id, :score, :content)
    end
end
