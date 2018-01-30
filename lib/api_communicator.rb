require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`

  character_hash["results"].each do|characters|
    if character == characters["name"].downcase
    characters.each do|attributes, values|
      if attributes == "films"
         return values
      end
    end
  elsif character_hash = JSON.parse(RestClient.get(character_hash["next"]))
      character_hash["results"].each do |characters|
        if character == characters["name"].downcase
          characters.each do|attributes, values|
            if attributes == "films"
              return values
            end
          end
        end
      end
    end
  end
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def parse_character_movies(films_hash)
  films_hash.map do |url|
    film = RestClient.get(url)
    movie = JSON.parse(film)
    header(movie)
  end
  # some iteration magic and puts out the movies in a nice list
end

def header (movie)
  puts "The #{movie["title"]}"
  puts "Produced by #{movie["producer"]}"
  puts "Directed by #{movie["director"]}"
  puts "Released: #{movie["release_date"]}"
  puts "*" *25
end

def show_character_movies(character)
  puts "#{character} appeared in:"
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)

end



## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
