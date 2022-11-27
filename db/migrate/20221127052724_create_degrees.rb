class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.belongs_to :student
      t.string :name
      t.string :city
      t.string :address
      t.string :phone
      t.string :degree #listing of major
      t.string :type #choices: associates; bachelors; masters; phd
      t.string :gpa
    end
  end
end
