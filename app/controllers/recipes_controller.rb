class RecipesController < ApplicationController
  before_action :set_user
  def index
    @recipes = @user.recipes
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    if user_signed_in?
      @recipe = @user.recipes.new
      respond_to do |format|
        format.html { render :new, locals: { recipe: @recipe } }
      end
      flash[:success] = ' Recipe added '
    else
      redirect_to new_user_session_path, alert: 'You must be logged in to create a recipe.'
    end
  end

  def create
    @recipe = @user.recipes.new(recipe_params)
    @recipe.user = @user
    respond_to do |format|
      format.html do
        if @recipe.save
          flash[:success] = ' recipe created '
          redirect_to user_recipes_path(@user)
        else
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(public: !@recipe.public?)
      flash[:notice] = ' Updated '
      redirect_to user_recipe_path(@recipe)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:success] = ' Recipe deleted '
    redirect_to user_recipes_path(@user)
  end
end

def minutes_to_hours(minutes)
  return "#{minutes}mins" unless minutes > 59

  hours = minutes / 60
  minute = minutes % 60
  return "#{hours}h #{minute}mins" unless minutes.zero?

  "#{hours}h"
end

private

def set_user
  @user = User.includes(:recipes).find(params[:user_id])
end

def recipe_params
  params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
end
