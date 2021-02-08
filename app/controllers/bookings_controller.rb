class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:date, :item_id).merge(user_id: current_user.id)
  end

end
