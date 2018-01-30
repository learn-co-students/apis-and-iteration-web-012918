require 'rest-client'
require 'json'
require 'pry'
require 'colorize'

## BONUS

# def get_character_info
#   #make the web request
#   all_characters = RestClient.get('http://www.swapi.co/api/people/')
#   character_hash = JSON.parse(all_characters)
#
#   character_hash.values.map do |char_hash|
#     char_hash[:results]
#   end.flatten
# end
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

def char_films_info(character)
  # all_characters = RestClient.get()
  # character_hash = JSON.parse(all_characters)
  char_info_hash = {}
  if all_char_hash["results"].find {|char_info| char_info["name"].downcase == character}
    char_info_hash = all_char_hash["results"].find {|char_info| char_info["name"].downcase == character}
  # else
  end
  char_info_hash
end

def all_char_hash
  all_char_hash = {}
  for n in 1..9
    all_characters = RestClient.get("http://www.swapi.co/api/people/?page=#{n}")
    character_hash = JSON.parse(all_characters)
    binding.pry
    all_char_hash = all_char_hash.merge(character_hash)
  end
  # binding.pry
  all_char_hash
end


def get_character_movies_from_api(character)
  char_films = char_films_info(character)["films"]
  films_hash = char_films.map do |film|
    JSON.parse(RestClient.get(film))
  end
end

def parse_character_movies(films_hash)
  films_hash.each do |film|
    puts film["title"].blue
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
