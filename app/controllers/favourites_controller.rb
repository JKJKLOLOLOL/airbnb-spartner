class FavouritesController < ApplicationController

  def create
    @favourite = Favourite.new(favourite_params)
    @favourite.wishlist = current_user.wishlists.find(params[:wishlist_id])

    if @favourite.save
      redirect_to listings_path
    else
      redirect_to root_path
    end
  end

  private

  def favourite_params
    params.require(:favourite).permit(:listing_id)
  end
end
