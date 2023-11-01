class RecipeFoodsController < ApplicationController
  before_action :set_user
  before_action :set_recipe
  def index
    @recipe_foods = @recipe.recipe_foods
    @foods = @user.foods
  end

  def show; end

  def new
    if user_signed_in?
      @foods = @user.foods
      @recipe_food = @recipe.recipe_foods.new
      respond_to do |format|
        format.html { render :new, locals: { recipe_food: @recipe_food } }
      end
    else
      redirect_to new_user_session_path, alert: 'You must be logged in to continue.'
    end
  end

  def create
    @foods = @user.foods
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)
    @recipe_food.recipe = @recipe
    respond_to do |format|
      format.html do
        if @recipe_food.save
          flash[:success] = ' Added '
          redirect_to new_user_recipe_recipe_food_path(@user, @recipe)
        else
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @food = Food.find(@recipe_food.food_id)
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(update_params)
      flash[:notice] = 'Quantity updated'
      redirect_to user_recipe_path(@user, @recipe)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    flash[:success] = ' Recipe deleted '
    redirect_to user_recipe_path(@user, @recipe)
  end
end

private

def set_recipe
  @recipe = Recipe.includes(:recipe_foods).find(params[:recipe_id])
end

def set_user
  @user = User.includes(:foods).find(params[:user_id])
end

def recipe_food_params
  params.require(:recipe_food).permit(:food_id, :quantity)
end

def update_params
  params.require(:recipe_food).permit(:quantity)
end
