require 'open-uri'
require 'JSON'

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
    encoded_search_term = search_term.gsub(/\s+/, "+").downcase

    query = "&q=#{encoded_search_term}"
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
      "&excludedIngredient[]=#{ingredient.name}"
    end.join("")
  end

  def allergies_to_query(allergies_array)
    allergies_array.map do |allergy|
    "&allowedAllergy[]=#{allergy.yummly_code}"
    end.join("")
  end

   def vegetarian_options_to_query(options_array)
    options_array.map do |option|
      "&allowedDiet[]=#{option.yummly_code}"
    end.join("")
  end

end