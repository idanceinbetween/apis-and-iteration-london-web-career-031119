require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/.json')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  test = response_hash["results"].find {|hash| hash["name"] == character_name}
end

def intialise_input(character_name)
  name = []
  character_name
end

def find_films(character_name)
  result = get_character_movies_from_api(character_name)
  film_names = result["films"]
end

def film_title(url)
response_string = RestClient.get(url)
response_hash = JSON.parse(response_string)
end

def grab(url)
 title =  film_title(url)["title"]
 puts "Title: #{title}"
end

def all_films(character_name)
  find_films(character_name).collect {|url| grab(url)}
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
