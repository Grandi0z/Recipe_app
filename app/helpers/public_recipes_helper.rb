module PublicRecipesHelper
  def group_by_recipe(recipes_food)
    recipes = {}
    recipes_food.each do |hash|
      # get the recipe and food keys and values
      recipe = hash.recipe
      food = hash.food
      quantity = hash.quantity
      # check if the recipe key already exists in the result hash
      if recipes.key?(recipe)
        # if yes, append the food and quantity hash to the existing array
        recipes[recipe] << { food:, quantity: }
      else
        # if not, create a new key-value pair with an array containing the food and quantity hash
        recipes[recipe] = [{ food:, quantity: }]
      end
    end
    recipes
  end

  def recipe_value(food_array)
    total_value = 0
    food_array.each do |food_item|
      total_value += food_item[:food].price * food_item[:quantity]
    end
    total_value.to_s
  end
end
