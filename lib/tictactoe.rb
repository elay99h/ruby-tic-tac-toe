#require 
require 'rspec'
require_relative "player"

class TicTacToe

	def initialize
		@board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]	
		@player1 = Player.new('Player 1', "X")
		@player2 = Player.new('Player 2', "O")
		@current_player = @player1
	end

	def draw_board()
	" #{@board[8]} | #{@board[7]} | #{@board[6]}\n ----------\n #{@board[5]} | #{@board[4]} | #{@board[3]}\n ----------\n #{@board[0]} | #{@board[1]} | #{@board[2]}"
	end

    WINNING_COMBOS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
      [0, 4, 8], [2, 4, 6]             # Diagonals
    ]

  
    def position_to_index(position)
    end

    def valid_move?(position)
    end

    def switch_turns(current_player)
    end

    def update_board(position)
    end

  	def check_winne
    end

    def board_full?
    end
  
end	


	
