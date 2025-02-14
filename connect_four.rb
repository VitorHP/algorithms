class ConnectFour
  def initialize
    puts ''
    puts ''
    puts '==CONNECT FOUR=='
    puts ''
  end

  def board
    @board ||= 6.times.map do
      7.times.map { |_n| '_' }
    end
  end

  def print_board
    board.each_with_index.map do |row, i|
      puts "#{i}: #{row.join(' ')}"
    end
  end

  def place_piece(player, col)
    column = board.map { |row| row[col] }

    empty = column.reverse.index('_')

    if empty.nil?
      puts 'Invalid move' and return
      return
    end

    @board[5 - empty][col] = player

    check_winner(player, col, 5 - empty)
  end

  def check_winner(player, col, row)
    puts "#{player} wins" if check_column(player, col) || check_row(player, row) || check_diagonals(player, col, row)
  end

  def play_moves(moves)
    moves.each do |move|
      place_piece(move[0], move[1])
    end
    puts ''

    print_board
  end

  private

  def check_column(player, col)
    column = board.map { |r| r[col] }

    connected_four?(player, column)
  end

  def check_row(player, row)
    row = board[row]

    connected_four?(player, row)
  end

  def check_diagonals(player, col, row)
    diagonal = (0..3).map do |n|
      @board[row + n]&.[](col - n)
    end

    reverse_diagonal = (0..3).map do |n|
      @board[row + n]&.[](col + n)
    end

    connected_four?(player, diagonal) ||
      connected_four?(player, reverse_diagonal)
  end

  def connected_four?(player, cells)
    Regexp.new("#{player}{4}").match? cells.join('')
  end
end

def test_col_win
  game = ConnectFour.new

  moves = [
    ['x', 0],
    ['0', 1],
    ['x', 0],
    ['0', 1],
    ['x', 0],
    ['0', 1],
    ['x', 0]
  ]

  game.play_moves(moves)
end

def test_row_win
  game = ConnectFour.new

  moves = [
    ['x', 0],
    ['0', 0],
    ['x', 1],
    ['0', 0],
    ['x', 2],
    ['0', 0],
    ['x', 3]
  ]

  game.play_moves(moves)
end

def test_diagonal_win
  game = ConnectFour.new

  moves = [
    ['x', 0],
    ['0', 1],
    ['x', 1],
    ['0', 2],
    ['0', 2],
    ['x', 2],
    ['0', 3],
    ['0', 3],
    ['0', 3],
    ['x', 3]
  ]

  game.play_moves(moves)
end

def test_reverse_diagonal_win
  game = ConnectFour.new

  moves = [
    ['x', 0],
    ['0', 1],
    ['x', 1],
    ['0', 2],
    ['0', 2],
    ['x', 2],
    ['0', 3],
    ['0', 3],
    ['0', 3],
    ['0', 1],
    ['0', 1],
    ['0', 0],
    ['0', 0],
    ['0', 0]
  ]

  game.play_moves(moves)
end

def test_invalid_input
  game = ConnectFour.new

  moves = [
    ['x', 0],
    ['x', 0],
    ['x', 0],
    ['0', 0],
    ['x', 0],
    ['0', 0],
    ['x', 0]
  ]

  game.play_moves(moves)
end

test_row_win
test_col_win
test_diagonal_win
test_reverse_diagonal_win
test_invalid_input
