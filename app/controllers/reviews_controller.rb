class ReviewsController < ApplicationController

  def new
    @beer = Beer.find_by_id(params[:beer_id])
    @review = @beer.reviews.build
  end

  def create
    @review = Review.new(review_params)
    redirect_to review_path(@review)
  end

  def index
    @reviews = Review.all
  end

  private

  def review_params
    params.require(:review).permit(:beer_id, :stars, :title. :content)
  end


end
