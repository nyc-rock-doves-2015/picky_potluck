class Rsvp < ActiveRecord::Base
  belongs_to :party
  belongs_to :user
  has_many :chosen_recipes
  has_many :recipes, through: :chosen_recipes

  validates_uniqueness_of :user_id, :scope => [:party_id]
  validates_uniqueness_of :party_id, :scope => [:user_id]
end
