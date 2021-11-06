require 'open-uri'
require 'pry-byebug'

Serie.destroy_all

series_titles = [
  "game of thrones",
  "ozark",
  "sons of anarchy",
  "breaking bad",
  "band of brothers",
  "chernobyl",
  "rick and morty"
]

series_titles.each do |serie|
  omdb_endpoint = "http://www.omdbapi.com/?t=#{serie}&apikey=afc205b"

  serialized_data = URI.open(omdb_endpoint).read
  result = JSON.parse(serialized_data)
  
  Serie.create(
    {
    name: result['Title'], 
    description: result['Plot'], 
    image_url: result['Poster']
    }
  )
end

reviews = Review.create!([
  {
    title: "The best serie of all time",
    description: "Perfect serie on every level!",
    score: 5,
    serie: Serie.first
  },
  {
    title: "Booooring",
    description: "Worst serie experience in years.",
    score: 1,
    serie: Serie.first
  }
])
