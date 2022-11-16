class GradApplication < ActiveRecord::Base


  validates :university, :date, :first_name, :last_name, :citizenship, :gender,
            :research_area, :deg_obj, :deg_obj_major, :ug_inst, :ug_inst_city,
            :ug_gpa, :ug_deg_earned, :recommender_1, presence: true
  # validates :university, presence: true
  # validates :date, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :gender, presence: true
  # validates :research_area, presence: true
  # validates :deg_obj, presence: true
  # validates :deg_obj_major, presence: true
  # validates :ug_inst, presence: true
  # validates :ug_inst_city, presence: true
  # validates :ug_gpa, presence: true
  # validates :ug_deg_earned, presence: true
  # validates :recommender_1, presence: true








  def find_application_by_department(department) ## sort of function that may be useful for filtering
    if department == "CSE"
      application_list = find_by_research_area("Machine Learning")
    elsif department == "EE"
      application_list = find_by_research_area("Machine Learning")
    end

  end
  

end