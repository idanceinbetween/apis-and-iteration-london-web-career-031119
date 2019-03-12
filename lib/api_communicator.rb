require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_hash = {}
  response_string = ""
  response_string = RestClient.get('http://www.swapi.co/api/people/.json')
  response_hash = JSON.parse(response_string)
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def capitalize_words(two_words)
  transform = two_words.split #array
  transformed_array = transform.collect {|word| word.capitalize}
  transformed_array.join(" ")
end

def find_character(character)
   get_character_movies_from_api(character)["results"].find {|hash| hash["name"] == capitalize_words(character)}
end#result is a hash of that character

# iterate over the response hash to find the collection of `films` for the given `character`
def find_films(character)
  target = find_character(character) #hash
  if target == nil
    return "Please enter correct character name."
  else
  films_of_character = target["films"]#an array of movies URLs
  end
end

# collect those film API urls, make a web request to each URL to get the info for that film
# return value of this method should be collection of info about each film.
#  i.e. an array of hashes in which each hash reps a given film
def film_api(url)
  film_response = RestClient.get(url)
  film_hash = JSON.parse(film_response)
end

def one_film(url)
  title = film_api(url)["title"]
  puts "Title: #{title}"
end

def all_film_titles(character)
  find_films(character).collect {|a_url| one_film(a_url)}
end #return array of film titles

# def print_movies(films)
#   # some iteration magic and puts out the movies in a nice list
# end
#
# def show_character_movies(character)
#   films = get_character_movies_from_api(character)
#   print_movies(films)
# end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
