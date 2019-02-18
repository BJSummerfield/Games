require_relative "model.rb"

def board
  puts "--------------------"
  puts "Player 1's Card: #{@p1[0]}"
  puts "Player 2's Card: #{@p2[0]}"
end

def war?
  puts "----War----"
  puts "Player 1's War Card: #{@war1.last}"
  puts "Player 2's War Card: #{@war2.last}"
end

