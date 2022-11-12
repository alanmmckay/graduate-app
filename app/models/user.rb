class EmailValidator < ActiveModel::Validator
  def validate(record)
    if not URI::MailTo::EMAIL_REGEXP.match?(record.email)
      record.errors.add :email, "Invalid email given"
    end
  end
end

class User < ActiveRecord::Base
  validates :password, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates_with EmailValidator

end
