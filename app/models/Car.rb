class Car < ActiveRecord::Base

  def self.get_all_cars
    Car.all
  end

  def save_car
    self.save!
  end

end
