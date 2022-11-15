class User < ActiveRecord::Base
  has_one :student
end
