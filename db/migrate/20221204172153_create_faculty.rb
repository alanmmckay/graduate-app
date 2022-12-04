class CreateFaculty < ActiveRecord::Migration

  def up
    create_table :faculty do |t|
      t.belongs_to :user
    end
  end
  def down
    drop_table :faculty
  end

end
