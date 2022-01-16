class FoodsController < ApplicationController
  def index
    if params[:sort_short_foods]
      @foods = Food.short_foods.page(params[:page]).per(10)
    elsif params[:sort_long_foods]
      @foods = Food.long_foods.page(params[:page]).per(10)
    else
      @foods = Food.page(params[:page]).per(10)
    end
    @food = Food.new
    @food_category = @food.food_category
    @food_categories = FoodCategory.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      redirect_to foods_path
    else
      @foods = Food.all
      @food_categories = FoodCategory.all
      render :index
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to foods_path
    else
      @food_categories = FoodCategory.all
      render :edit
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: "削除しました"
  end

  private

  def food_params
    params.require(:food).permit(:image, :name, :memo, :start_time, :food_category_id)
  end
end
