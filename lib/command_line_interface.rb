def welcome
  # puts out a welcome message here!
  puts "Welcome, how are you"
end

def get_character_from_user
  puts "Please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  result = gets.chomp
  result.split.map {|x| x.capitalize!}.join(" ")
end
