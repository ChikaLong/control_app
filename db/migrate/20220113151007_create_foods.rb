class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer :user, null: false
      t.integer :category_id, null: false
      t.string :image_id
      t.string :name, null: false
      t.datetime :expiration_date, null: false

      t.timestamps
    end
  end
end
