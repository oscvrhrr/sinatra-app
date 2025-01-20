require "sinatra"
require "sinatra/reloader"
require "http"
require "dotenv/load"
require "json"

get("/") do


  erb(:home)
end

get("/search") do 
  data = params.fetch("q")
  response = HTTP.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV.fetch("API_KEY")}&q=#{data}")
  parsed_data = JSON.parse(response)

  @id = parsed_data["data"][0]["id"]



  erb(:result)
end
