class ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
    @item_category = @item.item_category
    @item_categories = ItemCategory.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to items_path
    else
      @items = Item.all
      @item_categories = ItemCategory.all
      render :index
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path
    else
      @item_categories = ItemCategory.all
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, notice: "削除しました"
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :memo, :quantity, :item_category_id)
  end
end
