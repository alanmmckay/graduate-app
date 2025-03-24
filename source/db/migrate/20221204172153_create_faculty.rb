class CreateFaculty < ActiveRecord::Migration

  def up
    create_table :faculties do |t|
      t.belongs_to :user
      t.string :university
    end
  end



end
