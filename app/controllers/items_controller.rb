class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index

  def index
    @items = Item.all
    # @category = Category.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to category_path(@item.category.id)
    else
      render :new
    end
  end

  def show
    @booking = @item.bookings
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to category_path(@item.category.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to category_path(@item.category.id)
  end



  private

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path action: :index
    end
  end

  def item_params
    params.require(:item).permit(:name, :number, :category_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
