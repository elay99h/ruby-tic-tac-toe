# require
require 'rspec'
require_relative "player"
require_relative "dialog"

class TicTacToe
  attr_accessor :player1, :player2, :current_player, :winner

  def initialize
    @board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @player1 = Player.new('Player 1', "X")
    @player2 = Player.new('Player 2', "O")
    @current_player = @player1
    @dialog = Dialog.new
    @winner = nil
  end

  def draw_board
    puts "
  #{@board[6]} | #{@board[7]} | #{@board[8]}
  ----------
  #{@board[3]} | #{@board[4]} | #{@board[5]}
  ----------
  #{@board[0]} | #{@board[1]} | #{@board[2]}
  "
  end

  WINNING_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
    [0, 4, 8], [2, 4, 6]             # Diagonals
  ]


  # Places a player's token at the specified position on the board.
  def move(position, player = @current_player)
    @board[position] = player.token
  end

  # Validates if a move is valid
  # and if the position is not already taken.
  def valid_move?(position)
    on_board?(position) && !position_taken?(position)
  end

  # Checks if the move is on the board bounds
  def on_board?(position)
    position.between?(0, 8)
  end

  # Checks if a specified position on the board is taken by "X" or "O".
  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end

  # Switches the turn between Player 1 and Player 2 based on the number of moves made.
  def switch_turn
    count = 0
    @board.each do |cell|
      if cell == "X" || cell == "O"
        count += 1
      end
    end
    if count % 2 == 0
      @current_player = @player1
    else
      @current_player = @player2
    end
  end

  # Checks if the game board is completely filled with player tokens.
  def board_full?
    @board.all? { |cell| cell == "X" || cell == "O" }
  end

  # Checks for a winning combination on the game board.
  def has_winner?
    WINNING_COMBOS.each do |win_combo| # [0, 1, 2]
      index1, index2, index3 = win_combo

      if @board[index1] == @board[index2] && @board[index2] == @board[index3]
        return @winner = @board[win_combo[0]]
      end
    end
    return false
  end

  def turn
    puts @dialog.turn_of(current_player)
    puts @dialog.enter_input
    position = input_to_index(gets.chomp)
    if valid_move?(position)
      move(position)
      switch_turn
    else
      puts @dialog.unvalid_move
      turn
    end
  end

  def result
    if has_winner?
      puts @dialog.winner_is(@winner)
    elsif !has_winner? && board_full?
      puts @dialog.its_tie
    end
  end

  def play
    puts @dialog.welcome_to
    9.times do
      while !has_winner? && !board_full?
        draw_board
        turn
      end
    end
    draw_board
    result
    puts @dialog.made_with_love
  end
end

tictactoe = TicTacToe.new
tictactoe.play
