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


end
