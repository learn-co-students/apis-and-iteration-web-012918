#!/usr/bin/env ruby


require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
choice = chooser

if choice == "character"
  character = get_character_from_user
  show_character_movies(character)
else
  movie = get_movie_from_user
  show_movie_info(movie)
end
