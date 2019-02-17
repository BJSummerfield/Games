EMPTY = " "
P1 = "X"
P2 = "O"

class Board
  attr_reader :board

  def initialize(height: 3, width: 3, board: nil)
    @width = width
    @height = height
    @board = board || Array.new(height * width, EMPTY)
  end

  def player
    @board.join.count(P2) < @board.join.count(P1) ? P2 : P1
  end

  def place_at(index)
    raise ArgumentError.new("Given index is invalid") unless @board[index] == EMPTY

    @board[index] = player
  end

  def winner?
    (rows + columns + diagonals).any? do |way_to_win|
      completed?(way_to_win)
    end
  end

  def completed?(way_to_win)
    way_to_win[0] != EMPTY && way_to_win.all? do |element|
      element == way_to_win[0]
    end
  end

  def rows
    @board.each_slice(@width).to_a
  end

  def columns
    @width.times.map do |row|
      @height.times.map do |column|
        @board[row + (column * @width)]
      end
    end
  end

  def diagonals
    return [] unless @width != @height

    left = []
    right = []

    @width.times do |column|
      left << @board[column * @width + column]
      right << @board[2 * (column + 1)]
    end

    return [left, right]
  end
end