class BookingsController < ApplicationController
  before_action :move_to_index
  before_action :set_booking, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    if @booking.user_id == current_user.id
      @booking.destroy
    end
    redirect_to user_path(current_user.id)
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path action: :index
    end
  end

  def booking_params
    params.require(:booking).permit(:date, :item_id).merge(user_id: current_user.id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
