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

def get_movie_info_from_api(movie)
  all_movies = RestClient.get('https://swapi.co/api/films/')
  movies_hash = JSON.parse(all_movies)

  movies_hash["results"].each do |movie_info|
    if movie_info["title"].downcase == movie
      return movie_info
    end
  end

  puts "That title doesn't exist"
end

def parse_movie_info(movie)
  roman = ["I", "II", "III", "IV", "V", "VI"]

  puts "Title: #{movie["title"]}, Episode #{ roman[ movie["episode_id"]-1 ] }"
  puts ""
  puts movie["opening_crawl"]
end

def show_movie_info(movie)
  movie_hash = get_movie_info_from_api(movie)
  parse_movie_info(movie_hash)
end
