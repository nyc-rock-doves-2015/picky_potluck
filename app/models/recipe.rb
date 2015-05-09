class Recipe < ActiveRecord::Base
  has_many :chosen_recipes
  has_many :rsvps, through: :chosen_recipes
end