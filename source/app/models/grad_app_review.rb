class GradAppReview < ActiveRecord::Base

  belongs_to :grad_application
  belongs_to :faculty
  after_initialize :init

  validates :comments, :score,
            presence: true

  def init
     self.comments ||= ""
     self.score ||= 0
  end

end