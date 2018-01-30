require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  results = character_hash["results"]
  return_film_url(results, character)
end

  #returns film urls for specific character
def return_film_url(results, character)
  # binding.pry
  films = []
  results.each do |result|
    if result["name"].downcase == character
      films << result["films"]
    end
    films.flatten!
  end
   return_film_hashes(films)
end

  #returns film hashes for each film
def return_film_hashes(films)

  films = films.map do |film|
    film_string = RestClient.get(film)
    films_hash = JSON.parse(film_string.body)
    film = films_hash
  end
end

def get_movies_from_api(character)
  all_movies = RestClient.get('http://www.swapi.co/api/films/')
  movies_hash = JSON.parse(all_movies)
  results = movies_hash["results"]
end

def return_film_info(results, character)
  film_info = ""
  results.each do |result|
    if result["title"].downcase == character
      film_info = "Film director: #{result["director"]} & Film Producer:  #{result["producer"]}"
    end
  end
  puts film_info
end
def show_movie_info(character)
  movies_hash = get_movies_from_api(character)
  return_film_info(movies_hash, character)
end


def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list

  film_titles = []
  films_hash.each do |film|
    # binding.pry
    film_titles << film["title"]
  end
  film_titles.each_with_index do |val, index|
    puts "#{index + 1} #{val}"
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
