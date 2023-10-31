class Food < ApplicationRecord
  validates :name, presence: true, length: { in: 2..250 }
  validates :measurement_unit, presence: true, length: { in: 2..250 }
  validates :price, numericality: { only_decimal: true, greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_decimal: true, greater_than_or_equal_to: 0 }
  has_many :recipe_foods, foreign_key: 'food_id'

  belongs_to :user
end
