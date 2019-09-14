class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "-----------"
  end

  def input_to_index(string)
    i = string.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      true
    else
      false
    end
  end

  def valid_move?(position)
    if position_taken?(position) == false && position.between?(0,8)
      true
    else
      false
    end
  end

  def turn(position)
    if self.valid_move?(position)
      self.display_board
    else
      self.move
    end
  end

  def turn_count

  end

  def won?

  end

  def full?

  end

  def draw?

  end

  def over?

  end

  def winner

  end

  def play

  end
end
