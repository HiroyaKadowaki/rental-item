class RentalsController < ApplicationController
  before_action :move_to_index

  def index
    @rentals = Rental.new
  end

  def create
    @rental = Rental.new
    if @rental.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    # if @rental.user_id == current_user.id
    #   @rental.destroy
    # end
    # redirect_to root_path
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path action: :index
    end
  end
end
