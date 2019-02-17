class StdOut
  def self.render(board)
    p "Select a number between 0-9 to play a token"
    board.each_slice(3) do |slice|
      print slice.join('|') + "\n"
    end
  end

  def self.render_win
    p "We have a winner!"
  end

  def self.try_again
    p "Oops! That's not right. Try again."
  end
end