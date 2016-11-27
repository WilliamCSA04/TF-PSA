class CarsController < ApplicationController
 skip_before_filter :verify_authenticity_token

  def index
    @cars = Car.get_all_cars
  end

  def get
    @car = Car.find(:car_id)
  end

  def create
    begin
      raise "Full type is empty" if :full_type.empty?
      raise "Plate is empty" if :plate.empty?
      raise "Model is empty" if :model.empty?
      raise "Year is too old" if :year < 1884
      raise "Fuel capacity should be higher than 0" unless :fuel_capacity > 0
      raise "Manufacturer is empty" if :manufacturer.empty?
      @car = Car.new(cars_params)
      @car.save!
      render(json: @car.to_json)
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
