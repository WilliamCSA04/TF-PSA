class CarsController < ApplicationController

  def create
    begin
      raise "Full type is empty" if :full_type.empty?
      raise "Plate is empty" if :plate.empty?
      raise "Model is empty" if :model.empty?
      raise "Year is too old" if :year < 1884
      raise "Fuel capacity should be higher than 0" unless :fuel_capacity > 0
      raise "Manufacturer is empty" if :manufacturer.empty?
      @car = Car.new(params)
      @car.save_car
    rescue => e.message
      render(json: {error: e.message}, status: :unprocessable_entity)
    end
  end

  def update
    begin
      @car = Car.find(:car_id)
      @car.update_attributes(params)
      @car.save_car
    rescue => e.message
      render(json: {error: e.message}, status: :unprocessable_entity)
    end
  end

private

  def params
    params.permit(:fuel_type, :plate, :model, :year, :fuel_capacity, :manufacturer, :odometer)
  end


end
