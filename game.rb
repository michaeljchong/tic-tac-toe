class Board
  def initialize
    @board = [
      ['x','x','x'],
      ['x','x','x'],
      ['x','x','x']
    ]
  end

  def display
    @board.each do |row|
      print "|"
      row.each { |value| print "#{value}|" }
      puts
      puts " - - - "
    end
  end

  def position(row, col)
    @board[row][col]
  end

  def set_value(row, col, value)
    @board[row][col] = value
  end

  def full?
    @board.none? do |row|
      row.include?('')
    end
  end
end

class Player
  attr_reader :name, :sign

  @@player_count = 0
  def initialize(player_name)
    @name = player_name
    @@player_count += 1
    @sign = (@@player_count % 2 == 0) ? 'X' : 'O'
  end

  def turn
    
  end
end


b = Board.new()
b.display
b.set_value(0,1,'2')
b.display
p b.full?

p1 = Player.new("Bob")
p p1.sign, p1.name
p2 = Player.new("Sally")
p p2.sign, p2.name
