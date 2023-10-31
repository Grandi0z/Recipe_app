class UsersController < ApplicationController
  def index
    @user = current_user
    @foods = @user.foods
    @recipes = @user.recipes
  end

  def show; end
end
