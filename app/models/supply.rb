class Supply < ActiveRecord::Base

  def self.get_all_supplies
    Supply.all
  end

  def save_supply
    self.save!
  end

end
