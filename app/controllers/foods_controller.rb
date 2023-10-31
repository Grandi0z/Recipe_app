class FoodsController < ApplicationController
  before_action :set_user
  def index
    @foods = @user.foods
  end

  def show; end

  def new
    if user_signed_in?
      @food = @user.foods.new
      respond_to do |format|
        format.html { render :new, locals: { food: @food } }
      end
      flash[:success] = ' Food added '
    else
      redirect_to new_user_session_path, alert: 'You must be logged in to add a food.'
    end
  end

  def create
    @food = @user.foods.new(food_params)
    @food.user = @user
    respond_to do |format|
      format.html do
        if @food.save
          flash[:success] = ' Food created '
          redirect_to user_foods_path(@user)
        else
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:success] = ' Food deleted '
    redirect_to user_foods_path(@user)
  end
end

def food_params
  params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
end

private

def set_user
  @user = User.includes(:foods).find(params[:user_id])
end
