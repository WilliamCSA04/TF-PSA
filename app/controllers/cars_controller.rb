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
    if supplies.length > 0
      @value = total/supplies.length
    end
    @value = total
    render :template => "update_car"
  end

  def create
    begin
      @car = Car.new(cars_params)
      raise "invalid params" unless @car.valid?
      if @car.save!
        flash[:notice] = "Carro cadastrado com sucesso"
        redirect_to '/'
      else
        raise "Erro no cadastro"
      end
    rescue => e
      flash[:notice] = "Por favor preencha todos os campos, caso o erro continue, tente mais tarde"
      redirect_to '/cars/show'
    end
  end

  def update
    begin
      @car = Car.find(params[:car_id])
      raise "erro" unless @car.valid?
      @car.update_attributes(cars_params)
      flash[:notice] = 'Dados atualizados'
      redirect_to "/"
    rescue => e
      flash[:notice] = "Erro durante a atualizar"
      actual_page = "/cars/get/#{@car.id}"
      redirect_to actual_page
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
