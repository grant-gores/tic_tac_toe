class Player
  attr_accessor :symbol
  def initialize(symbol)
    @symbol = symbol
  end

  def get_move
    loop do
      print "Player #{symbol}, enter your move (row, col): "
      input = gets.chomp.split(",").map(&:to_i)
      return input if input.size == 2 && input.all? {|n| n.between?(0,2)}

      puts "Invalid input! Please enter two numbers between 0 and 2 separated by a comma."
    end
  end
end