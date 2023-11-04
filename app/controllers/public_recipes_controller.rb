class PublicRecipesController < ApplicationController
  before_action :filter_recipe_foods
  def index
    return unless user_signed_in?

    @user = current_user
  end

  def show; end

  private

  def filter_recipe_foods
    @recipes_foods = RecipeFood.includes(
      :food, :recipe
    ).where(
      recipes: { public: true }
    ).order(
      'recipes.created_at'
    ).reverse
  end
end
