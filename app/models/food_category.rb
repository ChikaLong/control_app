class FoodCategory < ApplicationRecord
  has_many :foods, dependent: :destroy

  validates :name, presence: true
end
