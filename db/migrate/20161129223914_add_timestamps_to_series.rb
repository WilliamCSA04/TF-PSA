class AddTimestampsToSeries < ActiveRecord::Migration
  def change

      add_column(:series, :created_at, :datetime)
      add_column(:series, :updated_at, :datetime)
  end
end
