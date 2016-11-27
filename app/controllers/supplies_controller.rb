class SuppliesController < ApplicationController

  def index
    @supplies = Supply.get_all_supplies
  end

  def get
    @supply = Supply.find(:supply_id)
  end

  def create
    begin
      @supply = Supply.new(supply_params)
      raise "invalid parameters" unless @supply.valid?
      @supply.save!
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

  def supply_params
    params.permit(:fuel_type, :fuel_quantity, :odometer_from_car :total_cost, :cost_liter, :car_id, :series_id)
  end

end
