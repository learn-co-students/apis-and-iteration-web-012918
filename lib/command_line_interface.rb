def welcome
  # puts out a welcome message here
  puts "Welcome to the Star Wars database!"
end


def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp.downcase
end
# 
# def get_movie_from_user
#   puts "please enter a movie"
#   # use gets to capture the user's input. This method should return that input, downcased.
#   gets.chomp.downcase
# end
#
#
# def char_or_movie
#   puts "movie or character"
#   gets.chomp.downcase
# end
