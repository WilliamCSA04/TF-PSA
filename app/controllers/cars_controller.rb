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
      raise "Full type is null" unless :full_type.present?
      raise "Plate is null" if :plate.present?
      raise "Model is null" if :model.present?
      raise "Year is null" unless :year.present?
      raise "Fuel capacity is null" unless :fuel_capacity.present?
      raise "Manufacturer is null" if :manufacturer.present?
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
