class SuppliesController < ApplicationController

  def index
    @supplies = Supply.get_all_supplies
  end

  def get
    @supply = Supply.find(:supply_id)
  end

  def create
    begin
      @car = Car.find(:car_id)
      raise "Car not registerred" unless @car.valid?
      total_cost = :cost_liter * :fuel_quantity
      @supply = Supply.new(fuel_type: :fuel_type, fuel_quantity: :fuel_quantity, odometer_from_car: @car.odometer, cost_liter: :cost_liter, total_cost: total_cost)
      if :new_series
        serie = Serie.create!
        @supply.serie_id = serie.id
      else
        last_supply = Supply.where(car_id: @car.id).order(created_at: :desc).first
        @supply.serie_id = last_supply.serie_id
      end
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
    params.permit(:fuel_type, :fuel_quantity, :cost_liter, :car_id, :new_series)
  end

end
