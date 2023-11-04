module RecipeFoodsHelper
  def value(quantity, unit_price)
    format('%.2f $', (quantity * unit_price))
  end

  def public?(recipe)
    recipe.public
  end
end
