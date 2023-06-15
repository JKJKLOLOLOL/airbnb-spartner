class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end
 
  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new
    @listing.save
  end
end
