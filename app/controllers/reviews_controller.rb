class ReviewsController < ApplicationController

  def new
    @costume = Costume.find(params[:costume_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.costume = Costume.find(params[:costume_id])

    if @review.save
      redirect_to my_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private 
  
  def review_params
    params.require(:review).permit(:rating, :content)
  end
  
end
