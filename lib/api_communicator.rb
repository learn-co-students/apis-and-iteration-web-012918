require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  char_films=[]
  character_hash["results"].each{ |ind_char_hash|
    if ind_char_hash["name"].downcase == character
      char_films = ind_char_hash["films"]
    end
  }

  get_films_from_api(char_films)
end
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`string
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

def get_films_from_api(char_films_array)
  char_films_array.map{ |url|
    one_film = RestClient.get(url)
    JSON.parse(one_film)
  }
end

def parse_character_movies(films_hash)
  films_hash.each{ |hash_in_a|
    puts hash_in_a["title"]
  }
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
