
class GradApplication < ActiveRecord::Base
  belongs_to :student
  has_many :letter_of_recommendations
  before_save
  validates :university, :date, :research_area, :deg_obj, :deg_obj_major, :statement_of_purpose,
            presence: true

  def find_application_by_department(department) ## sort of function that may be useful for filtering, not a complete function
    if department == "CSE"
      application_list = find_by_research_area("Machine Learning")
    elsif department == "EE"
      application_list = find_by_research_area("Machine Learning")
    end

  end

end