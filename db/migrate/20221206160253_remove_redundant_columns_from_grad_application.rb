class RemoveRedundantColumnsFromGradApplication < ActiveRecord::Migration
  def change
    remove_column :grad_applications, :first_name, :string
    remove_column :grad_applications, :last_name, :string
    remove_column :grad_applications, :citizenship, :string
    remove_column :grad_applications, :gender, :string
    remove_column :grad_applications, :ug_inst, :string
    remove_column :grad_applications, :ug_inst_city, :string
    remove_column :grad_applications, :ug_gpa, :string
    remove_column :grad_applications, :ug_deg_earned, :string
    remove_column :grad_applications, :grad_inst, :string
    remove_column :grad_applications, :grad_inst_city, :string
    remove_column :grad_applications, :grad_gpa, :string
    remove_column :grad_applications, :grad_deg_earned, :string
    remove_column :grad_applications, :recommender_1, :string
    remove_column :grad_applications, :recommender_2, :string
    remove_column :grad_applications, :recommender_3, :string
    remove_column :grad_applications, :recommendation_1_email, :string
    remove_column :grad_applications, :recommendation_2_email, :string
    remove_column :grad_applications, :recommendation_3_email, :string
  end
end
