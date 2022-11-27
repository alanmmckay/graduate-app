class EmailValidator < ActiveModel::Validator
  def validate(record)
    if not URI::MailTo::EMAIL_REGEXP.match?(record.recommendation_1_email)
      record.errors.add :recommendation_1_email, "Invalid email given"
    end
  end
end

class GradApplication < ActiveRecord::Base
  belongs_to :student
  before_save
  validates :university, :date, :first_name, :last_name, :citizenship, :gender,
            :research_area, :deg_obj, :deg_obj_major, :ug_inst, :ug_inst_city,
            :ug_gpa, :ug_deg_earned, :recommender_1,
            presence: true

  if (:recommendation_1_email != "")
    validates :recommendation_1_email, uniqueness: {case_sensitive: false}
    validates_with EmailValidator
  else
    validates :recommendation_1_email, presence: true
  end
  if (:recommendation_2_email != "")
    validates :recommendation_2_email, uniqueness: {case_sensitive: false}
    validates_with EmailValidator
  end
  if (:recommendation_3_email != "")
    validates :recommendation_3_email, uniqueness: {case_sensitive: false}
    validates_with EmailValidator
  end


  def find_application_by_department(department) ## sort of function that may be useful for filtering, not a complete function
    if department == "CSE"
      application_list = find_by_research_area("Machine Learning")
    elsif department == "EE"
      application_list = find_by_research_area("Machine Learning")
    end

  end

end