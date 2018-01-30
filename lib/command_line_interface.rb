def welcome
  puts "Welcome!"
end

def get_character_from_user
  puts "please enter a character or movie name"
  character = gets.chomp
  character.downcase
end
