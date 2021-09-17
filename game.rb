class Board
  def initialize
    @grid = [
      ['1','2','3'],
      ['4','5','6'],
      ['7','8','9']
    ]
  end

  def display
    @grid.each do |row|
      print "|"
      row.each { |value| print "#{value}|" }
      puts
      puts " - - - "
    end
  end

  def position(row, col)
    @grid[row][col]
  end

  def set_value(row, col, value)
    @grid[row][col] = value
  end

  def check_rows(sign)
    @grid.any? do |row|
      row.all? { |value| value == sign }
    end
  end

  def check_cols(sign)
    @grid.transpose.any? do |col|
      col.all? { |value| value == sign }
    end
  end

  def check_diags(sign)
    left_diag = [self.position(0, 0), self.position(1, 1), self.position(2, 2)]
    right_diag = [self.position(0, 2), self.position(1, 1), self.position(2, 0)]
    left_diag == [sign, sign, sign] || right_diag == [sign, sign, sign]
  end

  def win?(sign)
    check_rows(sign)
    check_cols(sign)
    check_diags(sign)
  end

  def full?
    @grid.none? do |row|
      row.include?(' ')
    end
  end

  def clear
    @grid.map! do |row|
      row.map! { |value| value = ' ' }
    end
  end
end

class Player
  attr_reader :name, :sign

  def initialize(sign)
    @sign = sign
    @name = (@sign == 'X') ? "Player 1" : "Player 2"
  end

  def get_move
    while
      input = gets.chomp
      break if ('1'..'9').include?(input)
      puts "Incorrect input. Enter a number from 1-9."
    end
    self.translate(input.to_i)
  end

  def translate(position)
    row = (position/3.0).ceil()-1
    col = (position+2)%3
    [row, col]
  end
end

class Game
  def initialize
    @board = Board.new()
    @player_1 = Player.new('X')
    @player_2 = Player.new('O')
  end

  def turn(player)
    puts "#{player.name}, what is your next move? Enter a number from 1-9."
    while
      move = player.get_move
      row, col = move[0], move[1]
      if @board.position(row, col) == ' '
        @board.set_value(row, col, player.sign)
        break
      end
      puts "That space has already been taken. Please choose another one."
    end
  end

  def intro
    puts "Let's play Tic Tac Toe!"
    puts "Enter your moves according to the following grid"
    @board.display
    @board.clear
    puts "Let's begin..."
  end

  def play
    self.intro
    current_player = @player_1
    until @board.full?
      @board.display
      turn(current_player)
      if @board.win?(current_player.sign)
        puts "#{current_player.name} has won!"
        return
      end
      current_player = (current_player == @player_1) ? @player_2 : @player_1
    end
    puts "It's a draw!"
  end
end

Game.new().play
