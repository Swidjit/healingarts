class AddUsersShifts < ActiveRecord::Migration
  def change
    create_table :shifts_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :shift, index: true
    end

  end
end
