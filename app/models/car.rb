class Car < ActiveRecord::Base

  def self.get_all_cars
    Car.all
  end

end
