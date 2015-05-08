class Nono < ActiveRecord::Base

  has_many :nono_users
  has_many :users, through: :nono_users


#3 arrays
#array of ingredients
#array of allergies
#array of vegetarian


  # # pass the return value of this method to generate_query in ApiCaller model
  # def self.get_search_code(array_of_nonos)
  #   ingredients = []
  #   allergies = []
  #   vegetarian_options = []
  #   array_of_nonos.each do |nono|
  #     case nono.category
  #     when "allergy"
  #       allergies << ALLERGIES[nono.name.to_sym]
  #     when "vegetarian"
  #       vegetarian_options << VEG_OPTIONS[nono.name.to_sym]
  #     else
  #       ingredients << nono.name
  #     end
  #   end
  #   query_args = {
  #     ingredients: ingredients,
  #     allergies: allergies,
  #     vegetarian_options: vegetarian_options
  #   }
  #   query_args
  # end

end
