class PagesController < ApplicationController
  def home
  end

  def hosting
    # reservations = []
    # current_user.listings.each do |listing|
    #   listing.reservations.each do |reservation|
    #     reservations << reservation
    #   end
    # end

    @reservations = Reservation.joins(:listing).where('listings.user_id = ?', current_user.id)

  end

end
