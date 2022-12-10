class Faculty < ActiveRecord::Base
  belongs_to :user
  has_many :grad_applications
  has_many :grad_app_reviews

  validates :university, presence: true

end
