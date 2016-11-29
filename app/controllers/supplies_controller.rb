class SuppliesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @supplies = Supply.get_all_supplies
  end

  def get
    @supply = Supply.find(:supply_id)
    render :template => "register_supply"
  end

  def create
    begin
      @car = Car.find(params[:car_id])
      raise "Car not registerred" unless @car.valid?
      total_cost = Integer(params[:cost_liter]) * Integer(params[:fuel_quantity])
      @supply = Supply.new(fuel_type: :fuel_type, fuel_quantity: params[:fuel_quantity], odometer_from_car: @car.odometer, cost_liter: params[:cost_liter], total_cost: total_cost, car_id: params[:car_id])
      if params[:new_series].nil?
        Serie.create!
        most_recent_serie = Serie.all.order(created_at: :desc).first
        raise "primeioro" if most_recent_serie.nil?
        @supply.series_id = most_recent_serie.id
      else
        last_supply = Supply.where(car_id: @car.id).order(created_at: :desc).first
        if last_supply.nil?
          Serie.create!
          most_recent_serie = Serie.all.order(created_at: :desc).first
          @supply.series_id = most_recent_serie.id
        else
          raise "segundo" if last_supply.nil?
          @supply.series_id = last_supply.series_id
        end

      end
      raise "invalid parameters" unless @supply.valid?
      @supply.save!
      redirect_to '/'
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
    @id = params[:car_id]
    render :template => "register_supply"
  end

private

  def supply_params
    params.permit(:fuel_type, :fuel_quantity, :cost_liter, :car_id, :new_series)
  end

end
