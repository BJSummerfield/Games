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

def win1
  puts "Player 1 Wins"
  exit
end

def win2
  puts "Player 2 Wins"
  exit
end

