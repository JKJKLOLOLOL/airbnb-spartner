class WishlistsController < ApplicationController
  def index
    # @wishlists = Wishlist.all
    @wishlists = current_user.wishlists
  end
  def show
    @wishlist = Wishlist.find(params[:id])
  end
end
