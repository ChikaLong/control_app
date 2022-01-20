class RenameExpirationDateColumnToFoods < ActiveRecord::Migration[5.2]
  def change
    rename_column :foods, :expiration_date, :start_time
  end
end
