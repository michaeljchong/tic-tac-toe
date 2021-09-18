class Board
  def initialize
    @grid = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9']
    ]
  end

  def display
    @grid.each do |row|
      print '|'
      row.each { |value| print "#{value}|" }
      puts
      puts ' - - - '
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
    left_diag = [position(0, 0), position(1, 1), position(2, 2)]
    right_diag = [position(0, 2), position(1, 1), position(2, 0)]
    left_diag == [sign, sign, sign] || right_diag == [sign, sign, sign]
  end

  def win?(sign)
    check_rows(sign) || check_cols(sign) || check_diags(sign)
  end

  def full?
    @grid.none? do |row|
      row.include?(' ')
    end
  end

  def clear
    @grid.map! do |row|
      row.map! { ' ' }
    end
  end
end

class Player
  attr_accessor :name
  attr_reader :sign

  def initialize(sign)
    @sign = sign
    @name = @sign == 'X' ? 'Player 1' : 'Player 2'
  end

  def turn(board)
    print "#{@name}, what is your next move? (Enter a number from 1-9) "
    while (move = player_move)
      row = move[0]
      col = move[1]
      if board.position(row, col) == ' '
        board.set_value(row, col, @sign)
        break
      end
      puts 'That space has already been taken. Please choose another one.'
    end
  end

  def player_move
    while (input = gets.chomp)
      break if ('1'..'9').include?(input)

      puts 'Incorrect input. Enter a number from 1-9.'
    end
    translate(input.to_i)
  end

  def translate(position)
    row = (position / 3.0).ceil - 1
    col = (position + 2) % 3
    [row, col]
  end
end

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new('X')
    @player2 = Player.new('O')
  end

  def intro
    puts "Let's play Tic Tac Toe!"
    set_names
    puts 'Enter your moves according to the following grid'
    @board.display
    @board.clear
    puts "Let's begin..."
  end

  def set_names
    print 'Who is playing? (default: Player 1) '
    name = gets.chomp
    @player1.name = name unless name.empty?
    print 'Who else is playing? (default: Player 2) '
    name = gets.chomp
    @player2.name = name unless name.empty?
  end

  def play
    intro
    player = @player1
    until @board.full?
      @board.display
      player.turn(@board)
      if @board.win?(player.sign)
        @board.display
        puts "#{player.name} has won!"
        return
      end
      player = player == @player1 ? @player2 : @player1
    end
    @board.display
    puts "It's a draw!"
  end
end

Game.new.play
