class Degree < ActiveRecord::Base
  belongs_to :student
  validates :name, :city, :major, :degree_type, :gpa, presence: true
end