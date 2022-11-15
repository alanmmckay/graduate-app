class GradApplications < ActiveRecord::Migration
  def change
    create_table :grad_applications do |t|
      t.string :first_name
      t.string :last_name
      t.string :citizenship
      t.string :gender
      t.string :research_area
      t.string :deg_obj
      t.string :deg_obj_major
      t.string :ug_inst
      t.string :ug_inst_city
      t.string :ug_gpa
      t.string :ug_deg_earned
      t.string :grad_inst
      t.string :grad_inst_city
      t.string :grad_gpa
      t.string :grad_deg_earned
      t.string :recommender_1
      t.string :recommender_2
      t.string :recommender_3
    end
  end
end
