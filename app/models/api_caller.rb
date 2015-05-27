require 'open-uri'

class ApiCaller
  def initialize
  end

  def request(nonos_array, search_term)
    query = generate_query(nonos_array, search_term)
    s = "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV["APPLICATION_ID"]}&_app_key=#{ENV["APPLICATION_KEY"]}#{query}"
    response = open(s)
    doc = ""
    response.each do |line|
      doc << line
    end
    response.close

    JSON.parse(doc)
  end

  def generate_query(nonos_array, search_term)
    query = "&q=#{URI.encode_www_form_component(search_term)}"
    vegetarian_options = nonos_array.select{|nono| nono.category == 'vegetarian'}
    ingredients = nonos_array.select{|nono| nono.category == 'ingredients'}
    allergies = nonos_array.select{|nono| nono.category == 'allergy'}
    query << ingredients_to_query(ingredients) if ingredients
    query << allergies_to_query(allergies) if allergies
    query << vegetarian_options_to_query(vegetarian_options) if vegetarian_options
    query
  end

  def ingredients_to_query(ingredients_array)
    ingredients_array.map do |ingredient|
        "&excludedIngredient[]=#{ingredient.name}" + format_related_foods(ingredient)
    end.join("")
  end

  def allergies_to_query(allergies_array)
    allergies_array.map do |allergy|
        "&excludedIngredient[]=#{allergy.yummly_code}" + format_related_foods(allergy)
    end.join("")
  end

   def vegetarian_options_to_query(options_array)
    options_array.map do |option|
      "&allowedDiet[]=#{option.yummly_code}" + format_related_foods(option)
    end.join("")
  end

  def format_related_foods(nono)
    if nono.related_foods
      related_foods = nono.related_foods.split(",")
      related_foods = related_foods.map{|rf| "&excludedIngredient[]=#{rf}"}.join("")
    else
      ""
    end
  end

end