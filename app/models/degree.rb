class Degree < ActiveRecord::Base
  belongs_to :student
  validates :name, :city, :major, :degree_type, :gpa, presence: { message: "Must be filled" }
=begin #alternative implementation below. Not good at this point in time because the error message takes a lot of screen space.
  labels = {"Name" => "Institution Name", "City" => "Institution City", "Major" => "Area of Study", "Degree type" => "Degree Earned", "Gpa" => "GPA Earned" }
  validates :name, :city, :major, :degree_type, :gpa,
            presence: {
              message: ->(object,data) do
                "#{labels[data[:attribute]]} must be filled"
              end
          }
=end
end