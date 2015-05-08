class Nono < ActiveRecord::Base
  has_many :nono_users
  has_many :users, through: :nono_users

  # possible values for type:
    # ingredient (q= excludedIngredient[])
    # allergy (q= allowedAllergy[])
    # vegetarian (q= allowedDiet[])

  ALLERGIES = {
    dairy: "396^Dairy-Free",
    egg: "397^Egg-Free",
    gluten: "393^Gluten-Free",
    peanut: "394^Peanut-Free",
    seafood: "398^Seafood-Free",
    sesame: "399^Sesame-Free",
    soy: "400^Soy-Free",
    sulfite: "401^Sulfite-Free",
    tree_nut: "395^Tree Nut-Free",
    wheat: "392^Wheat-Free"
  }

  VEG_OPTIONS = {
    lacto_veg: "388^Lacto vegetarian",
    ovo_veg: "389^Ovo vegetarian",
    pescetarian: "390^Pescetarian",
    vegan: "386^Vegan",
    vegetarian: "387^Lacto-ovo vegetarian",
    paleo: "403^Paleo"
  }

end
