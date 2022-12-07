class LetterOfRecommendation < ActiveRecord::Base
  belongs_to :grad_application
  validates :recommender_email, presence: true
  validates :url, uniqueness: true, presence: true
  after_initialize :init

  def init
    self.letter ||= ""
  end
end
