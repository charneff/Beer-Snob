class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end
  
end
