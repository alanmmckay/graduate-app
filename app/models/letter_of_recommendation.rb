class LetterOfRecommendation < ActiveRecord::Base
  belongs_to :grad_application
  validates :recommender_email, presence: true, on: create
  validates :url, uniqueness: true, presence: true, on: create
  after_initialize :init

  def init
    self.letter ||= ""
  end
end
