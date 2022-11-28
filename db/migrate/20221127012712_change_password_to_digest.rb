class ChangePasswordToDigest < ActiveRecord::Migration
  def change
    remove_column :users, :password, :text
    add_column :users, :password_digest, :string
  end
end
