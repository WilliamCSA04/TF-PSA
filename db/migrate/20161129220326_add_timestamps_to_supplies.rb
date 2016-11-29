class AddTimestampsToSupplies < ActiveRecord::Migration
  def change
    add_column(:supplies, :created_at, :datetime)
    add_column(:supplies, :updated_at, :datetime)
  end
end
