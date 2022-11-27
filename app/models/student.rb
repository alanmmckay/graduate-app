class Student < ActiveRecord::Base
  belongs_to :user
  has_many :grad_applications
  has_many :degrees
  after_initialize :init

  def init
    self.gender ||= ""
    self.citizenship ||= ""
  end
end
