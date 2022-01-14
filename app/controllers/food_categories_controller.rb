class FoodCategoriesController < ApplicationController
  def new
    @food_category = FoodCategory.new
  end

  def create
    @food_category = FoodCategory.new(food_category_params)
    if @food_category.save
      redirect_to foods_path
    else
      render :new
    end
  end

  private
  def food_category_params
    params.require(:food_category).permit(:name)
  end
end
