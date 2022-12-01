class EmailValidator < ActiveModel::Validator
  def validate(record)
    if not URI::MailTo::EMAIL_REGEXP.match?(record.email)
      record.errors.add :email, "Invalid email given"
    end
  end
end

class User < ActiveRecord::Base
  validates :email, uniqueness: {case_sensitive: false, message: "Email already in use"}, on: :create
  validates  :fname, :lname, presence: { message: "Name must be filled"}
  validates :password, presence: { message: "Password must be filled" }, on: :create
  validates :password_confirmation, presence: { message: "Password must be filled" }, on: :create
  validates :password, confirmation: { message: "Passwords do not match"}, on: :create
  has_secure_password #this must occur after the above validations; lest it overwrite messages involved.
  validates_with EmailValidator
  has_one :student
  after_initialize :init

  def init
    self.phone ||= ""
    self.email = self.email.downcase
  end

  def name
    self.fname + " " + self.lname
  end

end
