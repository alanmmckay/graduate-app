class Degree < ActiveRecord::Base
  belongs_to :student
  after_initialize :init
  def init
    self.name ||= ""
    self.city ||= ""
    self.major ||= ""
    self.degree_type ||= ""
    self.gpa || = ""
  end

end