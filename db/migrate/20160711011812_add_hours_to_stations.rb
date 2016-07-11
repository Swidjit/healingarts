class AddHoursToStations < ActiveRecord::Migration
  def change
    add_column :stations, :hours, :text, array: true

  end
end
