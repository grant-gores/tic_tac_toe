require_relative 'game'

class TicTacToe
  def start
    Game.new.play
  end
end