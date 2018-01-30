def welcome
  "Welcome to Star Wars character finder."
end

def get_character_from_user
  puts "please enter a character"
  input = gets.chomp
  input.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
