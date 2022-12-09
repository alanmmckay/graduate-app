class LetterOfRecommendation < ActiveRecord::Base
  belongs_to :grad_application
  validates_with ApplicationHelper::EmailValidator
  validates :url, uniqueness: true, presence: true
  after_initialize :init

  def init
    self.letter ||= ""
  end
end
