require 'rest-client'
require 'json'
require 'pry'

# def page_counter(character)
#   counter = 1
#   while counter < 80
#     all_characters = RestClient.get("https://www.swapi.co/api/people/?page=#{counter}")
#     character_hash = JSON.parse(all_characters)
#     character_films = get_character_movies_from_api(character)
#
#     if character_films == []
#       binding.pry
#       counter += 1
#     else
#       break
#     end
#   end
#
# end


def get_character_movies_from_api(character)
  #make the web request
  counter = 1
  while counter < 80
    all_characters = RestClient.get("https://www.swapi.co/api/people/?page=#{counter}")
    character_hash = JSON.parse(all_characters)

  character_films = []
    character_hash["results"].each do |character_hash|
      #array -- iterate over array, find given character name
      if character_hash["name"] == character
        character_films = character_hash["films"] #collected in an array
      end
    end
      #if character doesn't exist in hash - call counter method
    if character_films == []
      binding.pry
      counter += 1
    else
      break
    end
  end
character_films
end

# iterate over the character hash to find the collection of `films` for the given
#   `character`
# collect those film API urls, make a web request to each URL to get the info
#  for that film
# return value of this method should be collection of info about each film.
#  i.e. an array of hashes in which each hash reps a given film
# this collection will be the argument given to `parse_character_movies`
#  and that method will do some nice presentation stuff: puts out a list
#  of movies by title. play around with puts out other info about a given film.

# character_films = ["https://www.swapi.co/api/films/2/", "https://www.swapi.co/api/films/6/", "https://www.swapi.co/api/films/3/", "https://www.swapi.co/api/films/1/", "https://www.swapi.co/api/films/7/"]

def request_films(character)
#iterate over character_films, make a web request for each film, puts out data from that hash
character_films = get_character_movies_from_api(character)
  #make the web request
film_array = []
  character_films.each do |film|
      all_films = RestClient.get(film)
      film_hash = JSON.parse(all_films)
      film_array << film_hash
  end
  film_array
end


def parse_character_movies(character)
  # some iteration magic and puts out the movies in a nice list
  film_array = request_films(character)
  puts "#{character} appeared in: "
  film_array.each do |film|
    puts "  Star Wars Episode #{film["episode_id"]} - #{film["title"]}"
    puts "  Directed by #{film["director"]}"
  end
end


def show_character_movies(character)
  # films_hash = get_character_movies_from_api(character)
  parse_character_movies(character)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
