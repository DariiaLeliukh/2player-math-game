
class Game

  attr_reader :report_life, :player1, :player2, :current_player

  def initialize (p1, p2)
    @player1 = p1
    @player2 = p2
    @current_player = @player1
  end
  
  def subtract_life
    @current_player.life -= 1
  end

  def report_life
    puts "#{@player1.name}: #{@player1.life}/3  #{@player2.name}:#{@player2.life}/3"
  end

  def finish_game?
    if @current_player.life == 0
      if @current_player == @player1
        puts "#{player2.name} won with a score of #{@player2.life}/3"
      else
        puts "#{player1.name} won with a score of #{@player1.life}/3"
      end
    else
      false
    end
  end
  
  def change_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
  
end
