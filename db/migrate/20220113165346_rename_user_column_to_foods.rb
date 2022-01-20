class RenameUserColumnToFoods < ActiveRecord::Migration[5.2]
  def change
    rename_column :foods, :user, :user_id
  end
end
