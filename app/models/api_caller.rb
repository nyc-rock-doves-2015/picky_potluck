require 'open-uri'
require 'JSON'

class ApiCaller
  def initialize
    @app_id = "4079b16a"
    @app_key = "87db2b8f37674b94b105c8e8c088e2a4"
  end

  def request(args)
    ingredients = args[:ingredients]
    allergies = args[:allergies]
    vegetarian_options = args[:vegetarian_options]
    req = open("http://api.yummly.com/v1/api/recipes?_app_id=#{@app_id}&_app_key=#{@app_key}")
    puts JSON.parse(req.read)
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
      query_extension << "allowedDiet[]=#{option}&"
    end
    query_extension.chop
  end

end