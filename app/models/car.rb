class Car < ActiveRecord::Base

has_many :supplies

  def self.get_all_cars
    Car.all
  end

  def get_all_car_statistics
    supplies = Supply.where(car_id: self.id).order(created_at: :desc)
    return [] if supplies.nil?
    series_hash = {}
    actual_serie = supplies[0].series_id
    total_cost = 0
    min_serie_distance = 100000000
    max_serie_distance = 0
    total_liter = 0
    supplies.each do |s|
      element_serie = s.series_id
      element_distance = s.odometer_from_car

      if element_serie != actual_serie
        total_distance = max_serie_distance - min_serie_distance
        min_serie_distance = 100000000
        max_serie_distance = 0
        values = [total_distance/total_liter, total_distance, total_cost]
        total_cost = 0
        total_liter = 0
        series_hash[actual_serie] = values
        actual_serie = element_serie
      end

      if element_distance <= min_serie_distance
        min_serie_distance = element_distance
      end
      if element_distance >= max_serie_distance
        max_serie_distance = element_distance
      end
      total_liter += (s.total_cost.to_f / s.cost_liter.to_f)
      total_cost += s.total_cost
    end

    total_distance = max_serie_distance - min_serie_distance
    values = [total_distance/total_liter, total_distance, total_cost]
    series_hash[actual_serie] = values
    series_hash

  end

end
