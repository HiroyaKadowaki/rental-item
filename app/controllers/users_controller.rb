class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @rentals = @user.rentals
    @booking = @user.bookings
  end
end
