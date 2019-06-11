class BeersController < ApplicationController

  def new
    @beer = Beer.new
    @beer.build_brewery
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      redirect_to beer_path(@beer)
    else
      render :new
    end
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :style, :abv, :flavor_profile, :brewery_id, brewery_attributes: [:name, :location])
  end
end
