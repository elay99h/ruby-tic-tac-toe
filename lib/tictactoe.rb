#require 
require 'rspec'
require_relative "player"

class TicTacToe

  attr_accessor :player1, :player2, :current_player

	def initialize
		@board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]	
		@player1 = Player.new('Player 1', "X")
		@player2 = Player.new('Player 2', "O")
		@current_player = @player1
	end

  def display_board
    display_status
    draw_board
  end

	def draw_board
  puts "
  #{@board[8]} | #{@board[7]} | #{@board[6]}
  ----------
  #{@board[5]} | #{@board[4]} | #{@board[3]}
  ----------
  #{@board[0]} | #{@board[1]} | #{@board[2]}
  "

	end

  def display_status
    puts "\n"
    puts "Player 1 (X)  |  Player 2 (O)"
    puts "-----------------------------"
    puts "Player #{@current_player.token}, it is now your turn."
  end
  
    WINNING_COMBOS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
      [0, 4, 8], [2, 4, 6]             # Diagonals
    ]
  
    def input_to_index(input)
      input.to_i - 1
    end
    
    def position_taken?(position)
      if @board[position] == "" || @board[position] == " " || @board[position] == nil
        false
      else 
       true
      end
    end

    def move(position, player = @current_player)
      position = input_to_index(position)  
      @board[position] = player.token  
    end

    def valid_move?(position)
      if position.between?(1, 9) && !position_taken?(position) 
        true
      end
    end

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

    def board_full?
      @board.all? {|cell| cell == "X" || cell == "O"}
    end

  
end	


	
tictactoe = TicTacToe.new
tictactoe.display_board

