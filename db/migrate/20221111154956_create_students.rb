class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.references 'grad_application'
      t.references 'user'

      t.timestamps null: false
    end
  end

  def down
    drop_table :students
  end
end
