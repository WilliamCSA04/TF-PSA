class SuppliesController < ApplicationController

  def index
    @supplies = Supply.get_all_supplies
  end

end
