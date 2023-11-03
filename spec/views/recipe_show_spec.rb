require 'rails_helper'

RSpec.describe 'recipes/show', type: :feature do
  let(:user) { TestConfiguration.create_example_user }
  let(:recipe) do
    create(:recipe, public: true, preparation_time: 1, cooking_time: 1,
                    description: 'let descripe our public recipe here', user:)
  end
  before(:each) do
    visit user_recipe_path(user, recipe)
  end

  it 'displays recipe details' do
    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.preparation_time.to_s)
    expect(page).to have_content(recipe.cooking_time.to_s)
  end

  it 'displays ingredient list' do
    recipe.recipe_foods.each do |recipe_food|
      expect(page).to have_content(recipe_food.food.name)
      expect(page).to have_content(recipe_food.quantity.to_s)
      if recipe_food.food.price.present? && recipe_food.quantity.present?
        expect(page).to have_content("$#{recipe_food.food.price * recipe_food.quantity}")
      else
        expect(page).to have_content('Price unavailable')
      end
      expect(page).to have_button('Delete')
    end
  end
end
