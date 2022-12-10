class AddFacultyRefToGradApplication < ActiveRecord::Migration
  def change
    add_reference :grad_applications, :faculty, foreign_key: true
  end
end
