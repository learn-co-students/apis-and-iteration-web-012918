require 'colorize'

def welcome
  puts "Welcome to Star Wars!"
end

def get_character_from_user
  puts "please enter a character".red
  input_test
  # use gets to capture the user's input. This method should return that input, downcased.
end

def input_test
  input = gets.chomp.downcase
  if input == nil || input == ""
    puts "Sorry, this input is incorrect. Please enter a character's name from Star Wars.".red
    get_character_from_user
  end
  input
end
