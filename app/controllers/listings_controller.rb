class ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new
    @listing.save
  end
end
