class SearchesController < ApplicationController
  def food_category_search
    @food_category = FoodCategory.find(params[:food_category_id])
    if params[:sort_short_foods]
      @foods = @food_category.foods.short_foods
    elsif params[:sort_long_foods]
      @foods = @food_category.foods.long_foods
    else
      @foods = @food_category.foods.all
    end
    @food_categories = FoodCategory.all
    @food = Food.new
  end

  def item_category_search
    @item_category = ItemCategory.find(params[:item_category_id])
    if params[:sort_few_items]
      @items = @item_category.items.few_items
    elsif params[:sort_many_items]
      @items = @item_category.items.many_items
    else
      @items = @item_category.items.all
    end
    @item_categories = ItemCategory.all
    @item = Item.new
  end
end