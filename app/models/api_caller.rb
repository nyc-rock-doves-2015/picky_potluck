require 'open-uri'
require 'JSON'

class ApiCaller
  def initialize
    @app_id = "4079b16a"
    @app_key = "87db2b8f37674b94b105c8e8c088e2a4"
  end

  def request(args)
    query = generate_query(args)
    s = "http://api.yummly.com/v1/api/recipes?_app_id=#{@app_id}&_app_key=#{@app_key}#{query}"
    p s
    req = open(s)
    puts JSON.parse(req.read)
  end

  def generate_query(args)
    search_term = args[:search_term]
    ingredients = args[:ingredients]
    allergies = args[:allergies]
    vegetarian_options = args[:vegetarian_options]

    query = "&q=#{search_term}"
    query << ingredients_to_query(ingredients) + "&" if ingredients
    query << allergies_to_query(allergies) + "&" if allergies
    query << vegetarian_options_to_query(vegetarian_options) + "&" if vegetarian_options
    query.chop
  end

  def ingredients_to_query(ingredients_array)
    query_extension = ""
    ingredients_array.each do |ingredient|
      query_extension << 'excludedIngredient[]='
      query_extension << ingredient.gsub(/\s+/, "%20") + "&"
    end
    query_extension.chop
  end

  def allergies_to_query(allergies_array)
    query_extension = ""
    allergies_array.each do |allergy|
      query_extension << "allowedAllergy[]=#{allergy}&"
    end
    query_extension.chop
  end

   def vegetarian_options_to_query(options_array)
    query_extension = ""
    options_array.each do |option|
      query_extension << option.gsub(/\s+/, "%20") + "&"
      query_extension << "allowedDiet[]=#{option}&"
    end
    query_extension.chop
  end

end

req = ApiCaller.new
# p req.generate_query({ingredients: ['onion soup','potatoes','cheese'], allergies: ["396^Dairy-Free","397^Egg-Free"], vegetarian_options: ["388^Lacto vegetarian", "389^Ovo vegetarian"]})
p req.request({allergies: ["396%5EDairy-Free"]})