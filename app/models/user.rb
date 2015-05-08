class User < ActiveRecord::Base
  has_many :nono_users
  has_many :nonos, through: :nono_users
  has_many :rsvps
  has_many :parties, through: :rsvps

  has_secure_password
end
