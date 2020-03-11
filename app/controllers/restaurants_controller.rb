class RestaurantsController < ApplicationController
  def index
    all_restaurant
  end

  def show
    find_restaurant
  end

  def new
    new_restaurant
  end

  def create
    @restaurant = Restaurant.new(user_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  private

  def all_restaurant
    @restaurants = Restaurant.all
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def new_restaurant
    @restaurant = Restaurant.new
  end

  def user_params
    params.require(:restaurant).permit(:name, :phone_number, :address, :category)
  end
end
