class EmailValidator < ActiveModel::Validator
  def validate(record)
    if not URI::MailTo::EMAIL_REGEXP.match?(record.email)
      record.errors.add :email, "Invalid email given"
    end
  end
end

class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: { message: "Password must be filled" }, on: :create
  validates :password_confirmation, presence: { message: "Password must be filled" }, on: :create
  validates :password, confirmation: { message: "Passwords do not match"}, on: :create
  validates :email, uniqueness: {case_sensitive: false, message: "Email already in use"}, on: :create
  validates  :fname, :lname, presence: { message: "Name must be filled"}
  validates_with EmailValidator
  has_one :student
  after_initialize :init

  def init
    self.phone ||= ""
  end

  def name
    self.fname + " " + self.lname
  end

end
