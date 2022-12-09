class User < ActiveRecord::Base
  validates :password, presence: { message: "Password must be filled" }, on: :create
  validates :password_confirmation, presence: { message: "Password must be filled" }, on: :create
  validates :password, confirmation: { message: "Passwords do not match"}, on: :create
  has_secure_password #this must occur after the above validations; lest it overwrite messages involved.
  validates  :fname, :lname, presence: { message: "Name must be filled"}
  validates :email, uniqueness: {case_sensitive: false, message: "Email already in use"}, on: :create
  validates_with ApplicationHelper::EmailValidator
  has_one :student
  after_initialize :init

  def init
    self.phone ||= ""
  end


  def self.from_omniauth(response)
    User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
      u.email = response[:info][:email]
      u.password = SecureRandom.hex(15)
    end
  end

  def name
    self.fname + " " + self.lname
  end

  def degrees
    if not self.student.nil?
      self.student.degrees
    end
  end
end
