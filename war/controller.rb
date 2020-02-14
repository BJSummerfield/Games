require_relative "model.rb"
require_relative "views.rb"

def run_game
  deck
  shuffle(@deck)
  deal(@deck)
  while true
    checkwin
    board
    play
  end
end
run_game
