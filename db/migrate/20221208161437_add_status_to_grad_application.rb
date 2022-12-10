class AddStatusToGradApplication < ActiveRecord::Migration
  def change
    add_column(:grad_applications, :status, :string)
  end
end
