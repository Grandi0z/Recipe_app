class ChangeDefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_column_default :foods, :price, from: nil, to: 0
    change_column_default :foods, :quantity, from: nil, to: 0
    change_column_default :recipe_foods, :quantity, from: nil, to: 0
    change_column_default :recipes, :preparation_time, from: nil, to: 0
    change_column_default :recipes, :cooking_time, from: nil, to: 0
    change_column_default :recipes, :public, from: nil, to: true
    change_column_default :users, :email, from: nil, to: ""
  end
end
