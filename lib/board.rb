class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, " ") }
  end

  def display
    puts "\n"
    @grid.each_with_index do |row, i|
      puts row.map { |cell| cell.center(5) }.join("|")
      puts "-" * 17 unless i == 2  # Adjusts the width of the separator line
    end
    puts "\n"
  end

  def valid_move?(row, col)
    row.between?(0, 2) && col.between?(0, 2) && @grid[row][col] == " "
  end

  def place_symbol(row, col, symbol)
    @grid[row][col] = symbol if valid_move?(row, col)
  end

  def full?
    @grid.flatten.none? {|cell| cell == " "}
  end

  def winner?
    winning_lines.any? {|line| line.uniq.length == 1 && line.first != " "}
  end

  private

  def winning_lines
    @grid + @grid.transpose + diagonals
  end

  def diagonals
    [[@grid[0][0], @grid[1][1], @grid[2][2]], [@grid[0][2], @grid[1][1], @grid[2][0]]]
  end
end