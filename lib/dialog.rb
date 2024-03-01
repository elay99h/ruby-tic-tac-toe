class Dialog

   def welcome_to
     <<~WELCOME
       ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
       ┃  Welcome to Tic Tac Toe!  ┃
       ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
     WELCOME
   end
 
   def winner_is(winner)
     "Congratulations, #{winner}! You are the Ultimate Tic Tac Toe Champion!"
   end
 
   def turn_of(current_player)
     "Player #{current_player.token}, Your Turn"
   end
 
   def its_tie
     "It's a Tie! Well played."
   end
 
   def enter_input
     "Please input a number between 1 and 9 to make your play."
   end
 
   def unvalid_move
     "Invalid Move!"
   end
 
 end
 