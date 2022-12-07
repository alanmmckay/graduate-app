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

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
      end
    end
  end

  def name
    self.fname + " " + self.lname
  end

end
