require_relative '../lib/tictactoe'
require_relative '../lib/player'

describe TicTacToe do

  describe "#draw_board" do
    it 'displays the current state of the board' do
      tictactoe = TicTacToe.new
      expected_board = " 9 | 8 | 9\n ----------\n 6 | 5 | 4\n ----------\n 1 | 2 | 3"
      expect(tictactoe.draw_board).to eql(expected_board)
    end
  end

  describe "#position_to_index" do
    xit 'returns 8 if position is 9' do
      tictactoe = TicTacToe.new
      expect(tictactoe.position_to_index(9)).to eql(8)
    end

    xit 'returns "out" if position > 9' do
      tictactoe = TicTacToe.new
      expect(tictactoe.position_to_index(11)).to eql("out")
    end
  end

  describe "#valid_move?" do
    xit 'checks if the position is valid on the board' do
      tictactoe = TicTacToe.new
      expect(tictactoe.valid_move?(3)).to eql(false)
    end
  end

  describe "#switch_turns" do
    xit 'switches the current player' do
      tictactoe = TicTacToe.new
      current_player = tictactoe.instance_variable_get(:@current_player)
      tictactoe.switch_turns
      new_current_player = tictactoe.instance_variable_get(:@current_player)
      expect(new_current_player).not_to eql(current_player)
    end
  end

  describe "#update_board" do
    xit 'updates the board with the current player\'s marker at the specified position' do
      tictactoe = TicTacToe.new
      player1 = Player.new("Player 1", "X")

      tictactoe.instance_variable_set(:@current_player, player1)
      move_position = 8
      tictactoe.update_board(move_position)
      expected_board = " X | 8 | 9\n ----------\n 6 | 5 | 4\n ----------\n 1 | 2 | 3"
      expect(tictactoe.draw_board).to eql(expected_board)
    end
  end

  describe "#check_winne" do
    xit "checks if the current player has a winning combination" do
      tictactoe = TicTacToe.new
      player_x = Player.new("Player 1", "X")

      tictactoe.instance_variable_set(:@current_player, player_x)

      tictactoe.update_board(0)
      tictactoe.update_board(1)
      tictactoe.update_board(2)

      expect(tictactoe.check_winne).to eql(true)
    end
  end

 describe "#board_full?" do 
 	it "check if the board is full" do 
 		tictactoe = TicTacToe.new
 		player_x = Player.new("Player 2", "X")

 		tictactoe.instance_variable_set(:@current_player, player_x)

 		tictactoe.update_board(0)
 		tictactoe.update_board(1)
 		tictactoe.update_board(2)
 		tictactoe.update_board(3)
 		tictactoe.update_board(4)
 		tictactoe.update_board(5)
 		tictactoe.update_board(6)
 		tictactoe.update_board(7)
 		tictactoe.update_board(8)

 		expect(tictactoe.board_full?).to be true

 	end
 end

end
