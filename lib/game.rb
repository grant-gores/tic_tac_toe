require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @player = [Player.new("X"), Player.new("O")]
    @current_player = @players.first
  end

  def play
    loop do
      @board.display
      row, col = get_valid_move
      @board.place_symbol(row, col, @current_player.symbol)

      if @board.winner?
        @board.display
        puts "Player #{@current_player.symbol} wins!"
        return
      elsif @board.full?
        @board.display
        puts "It's a draw!"
        return
      end

      switch_turns

    end
  end

  private

def get_valid_move
  loop do
    move = @current_player.get_move
    return move if @board.valid_move?(*move)

    puts "That spot is already taken! Try again."
  end
end

def switch_turns
  @current_player = @player.rotate!.first
end

end