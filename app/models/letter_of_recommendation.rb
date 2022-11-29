class LettersOfRecommendation < ActiveRecord::Base
  belongs_to :grad_application
  validates :recommender_email, presence: true, on: create
  after_initialize :init

  def init
    self.letter ||= ""
  end
end
