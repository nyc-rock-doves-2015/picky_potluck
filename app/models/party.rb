class Party < ActiveRecord::Base
  has_many :party_users
  has_many :users, through: :party_users
end
