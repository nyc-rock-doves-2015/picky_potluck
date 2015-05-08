class Nono < ActiveRecord::Base
  has_many :nono_users
  has_many :users, through: :nono_users

  # possible values for type:
    # ingredient (q= excludedIngredient[])
    # allergy (q= allowedAllergy[])
    # vegetarian (q= allowedDiet[])
end
