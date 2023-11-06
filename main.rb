
require './game'
require './player'
require './question'

# set up players
print "Enter Player 1 name: "
name1 = gets.chomp.to_s
print "Enter Player 2 name: "
name2 = gets.chomp.to_s
player1 = Player.new(name1)
player2 = Player.new(name2)

# set current player
game = Game.new(player1, player2)

while game.player1.life > 0 and game.player2.life > 0 do
  # generate question and answer
  puts ' '
  puts "--- NEW TURN ---"
  question = Question.new
  print "#{game.current_player.name}: #{question.gen_question}"
  answer = question.answer

  # prompt for answer
  input = gets.chomp.to_i

  # check answer
  if (input != answer)
    puts "#{game.current_player.name}: Seriously? No!"
    game.subtract_life
  else 
    puts "#{game.current_player.name}: YES! You are correct."
  end

  #get reporting and check if we should finish the game
  game.report_life
  game.finish_game?

  # change turn
  game.change_player
end