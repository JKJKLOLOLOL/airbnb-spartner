class WishlistsController < ApplicationController
  def index
    @wishlists = Wishlist.all
  end

  def show
    @wishlist = Wishlist.find(params[:id])
  end
end

# belongs_to :user
# has_many :listings, through: :favourites
