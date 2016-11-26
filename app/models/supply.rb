class Supply < ActiveRecord::Base

  def self.get_all_supplies
    Supply.all
  end

end
