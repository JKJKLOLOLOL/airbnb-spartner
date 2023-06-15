class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show]

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  private

  def listing_params
    params.require(:listing).permit(:user, :name, :address, :max_cap, :description)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

end