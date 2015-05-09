class ChosenRecipe < ActiveRecord::Base
  belongs_to :rsvp
  belongs_to :recipe
end
