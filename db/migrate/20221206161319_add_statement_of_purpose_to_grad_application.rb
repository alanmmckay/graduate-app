class AddStatementOfPurposeToGradApplication < ActiveRecord::Migration
  def change
    add_column :grad_applications, :statement_of_purpose, :text
  end
end
