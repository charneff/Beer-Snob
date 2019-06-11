class ReviewsController < ApplicationController

  def new
    @beer = Beer.find_by_id(params[:id])
    @review = @beer.reviews.build 
  end

  def index
    @reviews = Review.all
  end

end
