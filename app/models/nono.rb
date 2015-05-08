class Nono < ActiveRecord::Base

  has_many :nono_users
  has_many :users, through: :nono_users

  # 3 possible values for category:
    # ingredient (q= excludedIngredient[])
    # allergy (q= allowedAllergy[])
    # vegetarian (q= allowedDiet[])

  ALLERGIES = {
    dairy: "396%5EDairy-Free",
    egg: "397%5EEgg-Free",
    gluten: "393%5EGluten-Free",
    peanut: "394%5EPeanut-Free",
    seafood: "398%5ESeafood-Free",
    sesame: "399%5ESesame-Free",
    soy: "400%5ESoy-Free",
    sulfite: "401%5ESulfite-Free",
    tree_nut: "395%5ETree%20Nut-Free",
    wheat: "392%5EWheat-Free"
  }

  VEG_OPTIONS = {
    lacto_veg: "388^Lacto vegetarian",
    ovo_veg: "389^Ovo vegetarian",
    pescetarian: "390^Pescetarian",
    vegan: "386^Vegan",
    vegetarian: "387^Lacto-ovo vegetarian",
    paleo: "403^Paleo"
  }

  # pass the return value of this method to generate_query in ApiCaller model
  def get_search_code(array_of_nonos)
    ingredients = []
    allergies = []
    vegetarian_options = []
    array_of_nonos.each do |nono|
      case nono.category
      when "allergy"
        allergies << ALLERGIES[nono.name.to_sym]
      when "vegetarian"
        vegetarian_options << VEG_OPTIONS[nono.name.to_sym]
      else
        ingredients << nono.name
      end
    end
    query_args = {
      ingredients: ingredients,
      allergies: allergies,
      vegetarian_options: vegetarian_options
    }
    query_args
  end

end
