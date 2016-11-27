class CarsController < ApplicationController
 skip_before_filter :verify_authenticity_token

  def index
    @cars = Car.get_all_cars
    render :template => "list_all_cars"
  end

  def get
    @car = Car.find(:car_id)
  end

  def create
    begin
      @car = Car.new(cars_params)
      raise "invalid params" unless @car.valid?
      @car.save!
      render :template => "register_car"
    rescue => e
      render(json: {error: e.message}, status: :unprocessable_entity)
    end
  end

  def update
    begin
      @car = Car.find(:car_id)
      @car.update_attributes(params)
    rescue => e.message
      render(json: {error: e.message}, status: :unprocessable_entity)
    end
  end

  def show
    render :template => "register_car"
  end

private

  def cars_params
    params.permit(:fuel_type, :plate, :model, :year, :fuel_capacity, :manufacturer, :odometer)
  end


end
