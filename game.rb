class Board
  attr_accessor :board

  def initialize
    @board = [
      ['','',''],
      ['','',''],
      ['','','']
    ]
  end

  def position(row, col)
    @board[row][col]
  end
end

class Player

end

b = Board.new()
p b.board
