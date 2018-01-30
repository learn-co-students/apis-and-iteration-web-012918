require 'rest-client'
require 'json'
require 'pry'

def get_character_info_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters) 
  ##Web request made
end

## This function takes the character given by
## user, returns a printout of the movies they are in.
def parse_character_movies(character)
  char_movies = movie_array(character)
  char_movies.each_with_index do |movie, index|
    puts "#{index + 1} #{movie}"
  end
end

## Gets us a big hash of all movies
def get_movies_from_api
  all_films = RestClient.get('http://www.swapi.co/api/films/')
  film_hash = JSON.parse(all_films) 
end

## Gives us entire hash of given character
def get_char_hash(character)
  character_hash = get_character_info_from_api(character)
  character_hash["results"].find do |result|
    result["name"].downcase == character #removed downcase from LH
  end
end

## Given a movie url, gives us a
## hash of a movie that matches
def movie_info(movie_url)
  movie_hash = get_movies_from_api
  movie_hash["results"].find do |movie_info|
    movie_info["url"] == movie_url
  end
end

## Given a character, returns an array of titles of all the 
## movies they were in
def movie_array(character)
  films_array = get_char_hash(character)["films"]
  films_array.map do |movie_url|
    movie_info(movie_url)["title"]
  end
end





