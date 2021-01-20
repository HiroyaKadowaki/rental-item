class CategoriesController < ApplicationController


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


  private
  def category_params
    params.require(:category).permit(:name).merge(user_id: current_user.id)
  end

end