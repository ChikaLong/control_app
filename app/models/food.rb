class Food < ApplicationRecord
  belongs_to :user
  belongs_to :food_category

  validates :name, presence: true
  validates :start_time, presence: true

  attachment :image
end
