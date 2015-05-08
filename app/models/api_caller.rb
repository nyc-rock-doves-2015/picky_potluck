require 'open-uri'
require 'JSON'

class ApiCaller
  def initialize
    @app_id = "4079b16a"
    @app_key = "87db2b8f37674b94b105c8e8c088e2a4"
  end

  def request
    req = open("http://api.yummly.com/v1/api/recipes?_app_id=#{@app_id}&_app_key=#{@app_key}")
    puts JSON.parse(req.read)
  end

end