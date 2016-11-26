class CreateCar < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string  :fuel_types,    null: false
      t.string  :plate,         null: false
      t.string  :model,         null: false
      t.integer :year,          null: false
      t.integer :fuel_capacity, null: false, default: 100
      t.string  :manufacturer,  null: false
      t.integer :odometer,      null: false, default: 0
      t.timestamp
    end
  end
end
