class UsersController < ApplicationController
  def show
    @user = current_user
    @foods = @user.foods
    @recipes = @user.recipes
  end
end
