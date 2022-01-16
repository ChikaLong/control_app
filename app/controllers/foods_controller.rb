class FoodsController < ApplicationController
  before_action :authenticate_user

  def index
    @user = User.find(current_user.id)
    if params[:sort_short_foods]
      @foods = @user.foods.short_foods.page(params[:page]).per(10)
    elsif params[:sort_long_foods]
      @foods = @user.foods.long_foods.page(params[:page]).per(10)
    else
      @foods = @user.foods.page(params[:page]).per(10)
    end
    @food = Food.new
    @food_category = @food.food_category
    @food_categories = FoodCategory.all
  end

  def show
    @user = User.find(current_user.id)
    @food = Food.find(params[:id])
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    @user = User.find(current_user.id)
    if @food.save
      redirect_to foods_path
    else
      @foods = @user.foods.page(params[:page]).per(10)
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
