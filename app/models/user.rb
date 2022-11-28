class EmailValidator < ActiveModel::Validator
  def validate(record)
    if not URI::MailTo::EMAIL_REGEXP.match?(record.email)
      record.errors.add :email, "Invalid email given"
    end
  end
end

class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true, on: create
  validates :password, confirmation: true, on: create
  validates :password_confirmation, presence: true, on: create
  validates :email, uniqueness: {case_sensitive: false}, on: create
  validates  :fname, :lname, presence: true
  validates_with EmailValidator
  has_one :student
  after_initialize :init

  def init
    self.phone ||= ""
    self.address ||= ""
  end

  def name
    self.fname + " " + self.lname
  end

end
