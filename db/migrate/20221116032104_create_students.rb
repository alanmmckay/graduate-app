class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.references 'user'
      t.string 'AppStatus'
    end
  end
  def down
    drop_table :students
  end
end

