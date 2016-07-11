class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :business, :string
    add_column :users, :skill, :string
    add_column :users, :needs_table, :boolean

  end
end
