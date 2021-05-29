class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :destroy, :edit, :update]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def destroy
    raise
    @restaurant.destroy
    redirect_to restaurant_path
  end

  # def destroy
  #   @garden.destroy
  #   redirect_to gardens_url, notice: 'Garden was successfully destroyed.'
  # end

  def edit
  end

  # PATCH/PUT /gardens/1
  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Garden was successfully updated.'
    else
      render :edit
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
