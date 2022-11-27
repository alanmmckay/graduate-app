class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.references :user, foreign_key: true
      t.references :grad_application, foreign_key: true
    end
  end
  def down
    drop_table :students
  end
end

