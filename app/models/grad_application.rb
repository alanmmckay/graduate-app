class GradApplication < ActiveRecord::Base
  belongs_to :student
  has_many :letter_of_recommendations
  has_many :grad_app_reviews
  validates :university, :date, :research_area, :deg_obj, :deg_obj_major, :statement_of_purpose, presence: true

  def init
    self.status ||= "In Progress"
  end

end
