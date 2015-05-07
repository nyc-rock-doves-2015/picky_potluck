class User < ActiveRecord::Base
  has_many :nono_users
  has_many :nonos, through: :nono_users
  has_many :party_users
  has_many :parties, through: :party_users

  has_secure_password
end
