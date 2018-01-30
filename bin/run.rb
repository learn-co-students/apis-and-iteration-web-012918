#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
# # show_character_movies(character)
 show_character_movies(character)

# request_films(["https://www.swapi.co/api/films/2/", "https://www.swapi.co/api/films/6/", "https://www.swapi.co/api/films/3/", "https://www.swapi.co/api/films/1/", "https://www.swapi.co/api/films/7/"])
# parse_character_movies("C-3PO")
