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

  def turn
    puts "please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each { |e|
      if e == "X" || e == "O"
        count += 1
      end
    }
    count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
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

  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end

  def draw?
    full? && !won?? true : false
  end

  def over?
    if draw?
      true
    end
  end

  def winner
    if won?
      won?[0]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "congratulations! #{winner}!"
    elsif draw?
      puts "it ended in a draw."
    end
  end
end
