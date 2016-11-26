class CreateSupply < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string  :fuel_type,         null: false
      t.integer :odometer_from_car, null: false
      t.integer :fuel_quantity,     null: false
      t.integer :total_cost,        null: false
      t.integer :cost_liter,        null: false
      t.integer :series_id,         null: false
      t.timestamp
    end
  end
end
