class Nono < ActiveRecord::Base

  has_many :nono_users
  has_many :users, through: :nono_users

  validates :name, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: %w(allergy ingredient vegetarian),
    message: "is not a valid category" }
  validates :yummly_code, presence: true, if: :needs_yummly_code?

  def needs_yummly_code?
    category == "allergy" || category == "vegetarian"
  end

end
