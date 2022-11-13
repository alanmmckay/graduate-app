class EmailValidator < ActiveModel::Validator
  def validate(record)
    if not URI::MailTo::EMAIL_REGEXP.match?(record.email)
      record.errors.add :email, "Invalid email given"
    end
  end
end

class User < ActiveRecord::Base
  before_save :set_name
  validates :password, :fname, :lname, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates_with EmailValidator

  def set_name
    self.name = self.fname + " " + self.lname
  end

end
