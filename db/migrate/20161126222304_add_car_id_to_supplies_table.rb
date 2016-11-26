class AddCarIdToSuppliesTable < ActiveRecord::Migration
  def change
    add_column :supplies, :car_id, :integer, null: false
  end
end
