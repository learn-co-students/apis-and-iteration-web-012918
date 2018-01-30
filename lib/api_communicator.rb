require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  found_character_films = get_characters_films('http://www.swapi.co/api/people/', character)

  film_info = found_character_films.map do |url|
    JSON.parse(RestClient.get(url))
  end

  film_info
end

def parse_character_movies(films_hash)
  films_hash.each do |movie_hash|
    puts movie_hash["title"]
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

def get_characters_films(url, character)
  all_characters = RestClient.get(url)
  character_hash = JSON.parse(all_characters)

  found_character_films = "nobody"
  character_hash["results"].each do |movie_character|
        if movie_character["name"].downcase == character
          found_character_films = movie_character["films"]
        end
  end
  if found_character_films != "nobody"
    found_character_films
  else
    get_characters_films(character_hash["next"], character)
  end
end
