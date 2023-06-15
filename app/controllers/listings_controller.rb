class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end
  def new
    @listings = Listing.new
  end
end
