class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :tables
      t.integer :roamers
    end
  end
end
