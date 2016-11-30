class ConsumptionController < ApplicationController
 skip_before_filter :verify_authenticity_token

  def search
    begin
      search = params[:search_field]
      raise "search field is null" if search.nil?
      @car = Car.where(plate: search.upcase).first
      raise "no car with this plate" if @car.nil?
      @supplies = Supply.where(car_id: @car.id).order(series_id: :desc)
      @series_hash = @car.get_all_car_statistics
      render :template => 'report'
    rescue => e
      render(json: {error: e.message}, status: :unprocessable_entity)
    end
  end


end
