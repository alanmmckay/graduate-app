class AddStudentRefToGradApplication < ActiveRecord::Migration
  def change
    add_reference :grad_applications, :student, index: true, foreign_key: true
  end
end
