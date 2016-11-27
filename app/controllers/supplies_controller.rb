class SuppliesController < ApplicationController

  def index
    @supplies = Supply.get_all_supplies
  end

  def get
    @supply = Supply.find(:supply_id)
  end

  def create
    begin
      raise "Fuel type is empty" if :fuel_type.empty?
      raise "Fuel quantity should be higher than 0" unless :fuel_quantity > 0
      @supply = Supply.new(params)
      @supply.save_supply
    rescue => e
      render(json: {error: e.message}, status: :unprocessable_entity)
    end

  end

  def update
    begin
      @supply = Supply.find(:supply_id)
      @supply.update_attributes(params)
    rescue => e
      render(json: {error: e.message}, status: :unprocessable_entity)
    end
  end

  def show
    render :template => "register_supply"
  end

private

  def params
    params.permit(:fuel_type, :fuel_capacity, :odometer_from_car, :total_cost, :cost_liter, :car_id, :series_id)
  end

end
