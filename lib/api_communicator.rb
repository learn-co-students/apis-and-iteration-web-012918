require 'rest-client'
require 'json'
require 'pry'
require 'byebug'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
  character_hash["results"].each do |data|
    # binding.pry
      if  data['name'].downcase == character
        return data["films"]
    end
  end
end



def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  # get_character_movies_from_api
  films_hash.each do |films|
    all_films = RestClient.get(films)
    film_hash = JSON.parse(all_films)
      puts film_hash["title"]
  end
end

def find_han_solo
  url = 'http://www.swapi.co/api/people/1'

  while true

  all_characters = RestClient.get(url)
  character_hash = JSON.parse(all_characters)

  character_hash.each do |att, data|
      if  data == 'Han Solo'
        puts 'You found Han!'
        return 'You found Han!'
      else
        last_num = url[-1].to_i
        last_num += 1
        url = url[0..-2] + last_num.to_s
        break
      end
    end
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

find_han_solo

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
