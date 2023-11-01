class ChangeQuantityTypeInRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    change_column :recipe_foods, :quantity, :decimal
  end
end
