require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  character_hash = get_character_hash(character.downcase)
  get_film_array(character_hash)

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def get_search_term(character)
  character.split.join("&")
end

def get_data(character)
  char = RestClient.get("http://www.swapi.co/api/people/?search=#{get_search_term(character)}")
  JSON.parse(char)
end

def get_character_hash(character)
  characters_hash = get_data(character)
  characters_hash["results"].each do |characters|
    if characters["name"].downcase == character
      return characters
    end
  end
end

def get_film_array(character_hash)
  character_hash["films"].collect do |films|
    film = RestClient.get(films)
    JSON.parse(film)
  end
end

def parse_character_movies(films_hash)
  films_hash.each do |film|
    puts film["title"]
  end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end



## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
