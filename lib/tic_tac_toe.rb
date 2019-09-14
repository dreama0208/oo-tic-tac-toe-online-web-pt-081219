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
    i = self.input_to_index(position)
    if self.valid_move?(i)
      self.move(i, token)
      self.display_board
    else
      self.turn
    end
  end

  def turn_count
    count = 0
    @board.each { |e|
      if e == "X" || e == "O"
        count += 1
    }
  end

  def won?
    board_empty = @board.none? {|e| e == "X" || e == "O" }
    if board_empty
      return false
    else
      WIN_COMBINATIONS.each { |comb|
        if @board[comb[0]] == "X" && @board[comb[1]] == "X" && @board[comb[2]] == "X" || @board[comb[0]] == "O" && @board[comb[1]] == "O" && @board[comb[2]] == "O"
          return comb
        else
          return false
        end
      }
    end


    end
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
