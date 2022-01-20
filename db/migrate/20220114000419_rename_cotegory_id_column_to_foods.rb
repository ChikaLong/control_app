class RenameCotegoryIdColumnToFoods < ActiveRecord::Migration[5.2]
  def change
    rename_column :foods, :category_id, :food_category_id
  end
end
