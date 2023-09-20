class ReviewsController < ApplicationController

  def new
    @costume = Costume.find(params[:costume_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.costume = Costume.find(params[:costume_id])
    @review.user = current_user
    @review.save
    redirect_to costume_path(@review.costume)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
