def welcome
  # puts out a welcome message here!
  "Welcome to the Star Wars game!"
end

def get_character_from_user
  puts "please enter a character"
  response = gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
