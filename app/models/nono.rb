class Nono < ActiveRecord::Base

  has_many :nono_users
  has_many :users, through: :nono_users

  validates :name, presence: true
  validates :category, presence: true

end
