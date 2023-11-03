class ShoppingListsController < ApplicationController
  before_action :set_user
  def index
    @used_food_quantity = set_used_food_quantity
    shopping_info = set_shopping_list
    @total_price = shopping_info[:total_price]
    @shopping_list = shopping_info[:shopping_list]
  end
end

def set_user
  @user = current_user
end

def set_used_food_quantity
  user_items = @user.recipes.includes(:foods, :recipe_foods).all
  # take foods used in recipe_food
  # knowing that every item contains <food> <recipe> and <recipefoood>
  used_foods = {}
  user_items.each do |item|
    item.recipe_foods.each do |recipe_food|
      if used_foods[recipe_food.food_id].present?
        used_foods[recipe_food.food_id] += recipe_food.quantity
      else
        used_foods[recipe_food.food_id] = recipe_food.quantity
      end
    end
  end
  used_foods
end

def set_shopping_list
  total_price = 0
  shopping_list = {}
  @used_food_quantity.each do |food_id, quantity|
    food = Food.find_by(id: food_id)
    next unless food.quantity < quantity

    needed_quantity = quantity - food.quantity
    total_price += needed_quantity * food.price
    shopping_list[food_id] = {
      name: food.name,
      quantity: needed_quantity,
      total_price_item: needed_quantity * food.price,
      measurement_unit: food.measurement_unit
    }
  end
  { shopping_list:, total_price: }
end
