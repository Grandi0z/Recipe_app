class Recipe < ApplicationRecord
  validates :name, presence: true, length: { in: 2..250 }
  validates :description, presence: true, length: { in: 10..5000 }
  validates :preparation_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :recipe_foods, foreign_key: 'recipe_id', dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :nullify

  belongs_to :user
end
