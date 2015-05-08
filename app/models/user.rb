class User < ActiveRecord::Base
  has_many :nono_users
  has_many :nonos, through: :nono_users
  has_many :rsvps
  has_many :parties, through: :rsvps

  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
