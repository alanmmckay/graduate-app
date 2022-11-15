class GradApplication < ActiveRecord::Base

  def find_application_by_department(department)
    if department == "CSE"
      application_list = find_by_research_area("Machine Learning")
    elsif department == "EE"
      application_list = find_by_research_area("Machine Learning")
    end

  end
  

end