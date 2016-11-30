class CarsController < ApplicationController
 skip_before_filter :verify_authenticity_token

  def index
    @cars = Car.get_all_cars
    render :template => "list_all_cars"
  end

  def get
    @car = Car.find(params[:car_id])
    supplies = Supply.where(car_id: @car.id)
    total = 0
    supplies.each do |supply|
      total += supply.fuel_quantity
    end
    @value = total/supplies.length
    render :template => "update_car"
  end

  def create
    begin
      @car = Car.new(cars_params)
      raise "invalid params" unless @car.valid?
      if @car.save!
        redirect_to '/'
      else
        raise "Erro no cadastro"
      end
    rescue => e
      redirect_to '/cars/show'
    end
  end

  def update
    begin
      @car = Car.find(params[:car_id])
      @car.update_attributes(cars_params)
      redirect_to "/"
    rescue => e
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
