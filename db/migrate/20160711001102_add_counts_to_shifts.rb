class AddCountsToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :table_count, :integer, :default => 0
    add_column :shifts, :roamer_count, :integer, :default => 0
    add_column :shifts, :table_max, :integer
    add_column :shifts, :roamer_max, :integer
  end
end
