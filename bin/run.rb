#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
if find_character(character) == nil
  puts "Sorry. Character does not exist, you are kicked out of Star Wars. May the force be not with you."
else
  all_film_titles(character)
end

#show_character_movies(character)
