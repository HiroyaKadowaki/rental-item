class RentalsController < ApplicationController
  before_action :move_to_index
  before_action :set_rental, only: [:edit, :destroy]

  def index
    @rentals = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  def edit
  end

  def destroy
     if current_user.id == @rental.user_id
       @rental.destroy
     end
     redirect_to root_path
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path action: :index
    end
  end

  def rental_params
    params.permit(:rental_day).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end

end
