class MoveAttributesToStudent < ActiveRecord::Migration
  def self.up
    add_column :students,:address, :text
    # An update query should exist here, but there has been no entry point for this field within this program yet
    remove_column :users, :address
  end
  def self.down
    add_column :users, :address, :text
    # An update query should exist here, but there has been no entry point for this field within this program yet
    remove_column :students, :address
  end
end
