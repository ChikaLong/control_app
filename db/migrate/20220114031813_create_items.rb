class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id, null: false
      t.integer :item_category_id, null: false
      t.string :image_id
      t.string :name, null: false
      t.text :memo
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
