class AddMemoToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :memo, :text
  end
end
