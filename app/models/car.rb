class Car < ActiveRecord::Base

has_many :supplies

  def self.get_all_cars
    Car.all
  end

end
