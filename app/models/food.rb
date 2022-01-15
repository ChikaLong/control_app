class Food < ApplicationRecord
  belongs_to :user
  belongs_to :food_category

  validates :name, presence: true
  validates :start_time, presence: true

  attachment :image

  # ソート機能
  scope :short_foods, -> { order(start_time: :asc) }
  scope :long_foods, -> { order(start_time: :desc) }
end
