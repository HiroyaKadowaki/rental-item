class CategoriesController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @categorys = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = @category.items
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def category_params
    params.require(:category).permit(:name).merge(user_id: current_user.id)
  end

  def set_item
    @category = Category.find(params[:id])
  end

end
