class Board
  attr_reader :board

  def initialize
    @board = [
      ['x','x','x'],
      ['x','x','x'],
      ['x','x','x']
    ]
  end

  def display
    board.each do |row|
      print "|"
      row.each { |value| print "#{value}|" }
      puts
      puts " - - - "
    end
  end

  def position(row, col)
    board[row][col]
  end

  def set_value(row, col, value)
    board[row][col] = value
  end

  def full?
    board.none? do |row|
      row.include?('')
    end
  end
end

class Player

end

b = Board.new()
b.display
b.set_value(0,1,'2')
b.display
p b.full?
