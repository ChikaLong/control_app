class Item < ApplicationRecord
  belongs_to :user
  belongs_to :item_category

  validates :name, presence: true
  validates :quantity, presence: true

  attachment :image

  # 在庫の少ないitemをマイページに表示
  scope :few, -> { order(quantity: :asc).limit(5) }

  # ソート機能関連
  scope :few_items, -> { order(quantity: :asc) }
  scope :many_items, -> { order(quantity: :desc) }
end
