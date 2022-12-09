class Student < ActiveRecord::Base
  belongs_to :user
  has_many :grad_applications
  has_many :degrees
  after_initialize :init
  validates :gender, :citizenship, :address, presence: true

  def init
    self.gender ||= ""
    self.citizenship ||= ""
    self.address ||= ""
  end
end
