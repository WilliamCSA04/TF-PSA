class ConsumptionController < ApplicationController
 skip_before_filter :verify_authenticity_token

  def index

    begin
      @consumption = Supply.where(car_id: params[:car_id])
      raise "invalid object is null" unless @consumption.present?
      render :template => "car_consumption"
    rescue => e
      render(json: {error: e.message}, status: :unprocessable_entity)
    end
  end

  def search
    begin
      search = params[:search_field]
      raise "search field is null" if search.nil?
      @car = Car.where(plate: search).first
      raise "no car with this plate" if @car.nil?
      @supplies = Supply.where(car_id: @car.id).order(series_id: :desc)
      @series_hash = @car.get_all_car_statistics
      render :template => 'report'
    rescue => e
      render(json: {error: e.message}, status: :unprocessable_entity)
    end
  end


end
