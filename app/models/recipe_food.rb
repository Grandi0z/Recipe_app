class RecipeFood < ApplicationRecord
  validates :quantity, numericality: { only_decimal: true, greater_than_or_equal_to: 0 }
  belongs_to :recipe
  belongs_to :food

  after_create :update_food_quantity

  private

  def update_food_quantity
    if food.quantity >= quantity # if the food quantity is enough for the recipe_food quantity
      food.decrement(:quantity, quantity)
      food.save
    else
      food.update(quantity: 0) # Set the food quantity to zero if food is not enough
    end
  end
end
