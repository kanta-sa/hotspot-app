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
    if @review.save
      @object = @review
      render :review
    else
      @object = @review
      render :review
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @object = @review
    return unless @review.user_id == current_user.id
    
    render :review if @review.destroy
  end
  
  private
    def review_params
      params.require(:review).permit(:post_id, :score, :content)
    end
end
