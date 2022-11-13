class AddPersonalInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :text
    add_column :users, :address, :text
    add_column :users, :phone, :text
    add_column :users, :lname, :text
    add_column :users, :fname, :text
  end
end
