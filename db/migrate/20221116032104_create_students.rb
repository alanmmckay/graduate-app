class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.references 'user'
      t.string 'app_status'
    end
  end
  def down
    drop_table :students
  end
end

