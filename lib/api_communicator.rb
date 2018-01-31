require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  # all_characters = RestClient.get('http://www.swapi.co/api/people/')
  # character_hash = JSON.parse(all_characters)
  # char_films=[]
  # character_hash["results"].each{ |ind_char_hash|
  #   if ind_char_hash["name"].downcase == character
  #     char_films = ind_char_hash["films"]
  #   end
  # }
  # get_films_from_api(char_films)


  url = 'http://www.swapi.co/api/people/'
  char_films=[]
  arr = (1..88).to_a
  arr.delete(17)
  arr.each{ |p|
    page = url + p.to_s
    all_characters = RestClient.get(page)
    character_hash = JSON.parse(all_characters)
    if character_hash["name"].downcase == character
      char_films = character_hash["films"]
      break
    end
  }
  get_films_from_api(char_films)
end

# binding.pry

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
# get char from all pages
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

#
#
# def get_movie_chars_from_api(movie)
#   all_movies = RestClient.get('http://www.swapi.co/api/films/')
#   movie_hash = JSON.parse(all_movies)
#   mov=[]
#   movie_hash["results"].each{ |ind_mov_hash|
#     if ind_mov_hash["title"].downcase == movie
#       mov = ind_mov_hash["character"]
#     end
#   }
#   get_chars_from_api(mov)
# end
#
# def get_chars_from_api(char_chars_array)
#   char_chars_array.map{ |url|
#     one_char = RestClient.get(url)
#     JSON.parse(one_char)
#   }
# end
#
# def parse_characters(chars_hash)
#   chars_hash.each{ |hash_in_a|
#     puts hash_in_a["name"]
#   }
#   # some iteration magic and puts out the movies in a nice list
# end
#
# def show_characters_in_movie(character)
#   char_hash = get_movie_chars_from_api(character)
#   parse_characters(char_hash)
# end

# show_characters_in_movie("A New Hope")
