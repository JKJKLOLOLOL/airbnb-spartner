class ReservationsController < ApplicationController
  before_action :set_listing, only: %i[new create]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.listing = @listing
    @reservation.user = current_user

    if @reservation.save
      redirect_to listing_reservation_path(@listing, @reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def accept
    @reservation = Reservation.find(params[:id])
    @reservation.status = "Accepeted"
    @reservation.save
    redirect_to hosting_path
  end

  def reject
    @reservation = Reservation.find(params[:id])
    @reservation.status = "Rejected"
    @reservation.save
    redirect_to hosting_path
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :status)
  end
end
