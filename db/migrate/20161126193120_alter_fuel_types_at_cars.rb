class AlterFuelTypesAtCars < ActiveRecord::Migration
  def change
    rename_column :cars, :fuel_types, :fuel_type
  end
end
