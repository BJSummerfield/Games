require_relative "./models/board.rb"
require_relative "./views/stdout.rb"
require_relative "./controllers/controller.rb"

view = StdOut
game = Board.new(height: 3, width: 3)
controller = Controller.new(model: game, view: view)

view.render(game.board)

loop do
  controller.accept_input(gets.chomp)
end