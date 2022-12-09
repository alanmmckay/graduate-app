class AddStudentRefToGradApplication < ActiveRecord::Migration
  def change
    add_reference :grad_applications, :student, foreign_key: true
  end
end
