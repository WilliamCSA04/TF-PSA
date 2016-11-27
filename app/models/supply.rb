class Supply < ActiveRecord::Base

has_one :serie
has_one :car


  def self.get_all_supplies
    Supply.all
  end
end
