def welcome
  puts "Welcome to the Star Wars Universe" #put a lightsaber noise if we get the time
end

def chooser
  puts "What would you like to search? (Type 'movie' or 'character')"
  gets.chomp.downcase
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp.downcase
end

def get_movie_from_user
  puts "Please enter a movie name"
  gets.chomp.downcase
end
