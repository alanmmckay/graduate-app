class AddAttributesToStudent < ActiveRecord::Migration
  def change
    add_column :students, :gender, :text
    add_column :students, :citizenship, :text
  end
end
