class Car < ActiveRecord::Base

  def get_all_cars
    Car.all
  end

  def create_car
    self.save!
  end

end
