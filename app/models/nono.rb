class Nono < ActiveRecord::Base
  has_many :nono_users
  has_many :users, through: :nono_users
end
