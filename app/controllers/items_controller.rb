class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    # unless @item.user_id == current_user.id
    #   redirect_to action: :index
    # end
  end

  def update
    # if @item.update(item_params)
    #   redirect_to root_path
    # else
    #   render :edit
    # end
  end

  def destroy
    # if @item.user_id == current_user.id
    #   @item.destroy
    # end
    # redirect_to root_path
  end



  private
  def item_params
    params.require(:item).permit(:name, :number, :comment).merge(user_id: current_user.id)
  end


end
