class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.references 'user'
      t.references 'grad_application'
    end
  end
  def down
    drop_table :students
  end
end

