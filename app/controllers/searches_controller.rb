class SearchesController < ApplicationController
  before_action :authenticate_user

  def food_category_search
    @food_category = FoodCategory.find(params[:food_category_id])
    if params[:sort_short_foods]
      @foods = @food_category.foods.where(user_id: current_user.id).short_foods.page(params[:page]).per(10)
    elsif params[:sort_long_foods]
      @foods = @food_category.foods.where(user_id: current_user.id).long_foods.page(params[:page]).per(10)
    else
      @foods = @food_category.foods.where(user_id: current_user.id).page(params[:page]).per(10)
    end
    @food_categories = FoodCategory.all
    @food = Food.new
    @user = User.find(current_user.id)
  end

  def item_category_search
    @item_category = ItemCategory.find(params[:item_category_id])
    if params[:sort_few_items]
      @items = @item_category.items.where(user_id: current_user.id).few_items.page(params[:page]).per(10)
    elsif params[:sort_many_items]
      @items = @item_category.items.where(user_id: current_user.id).many_items.page(params[:page]).per(10)
    else
      @items = @item_category.items.where(user_id: current_user.id).page(params[:page]).per(10)
    end
    @item_categories = ItemCategory.all
    @item = Item.new
    @user = User.find(current_user.id)
  end
end
