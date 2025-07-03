class Minesweeper
  @input : Array(String)

  def initialize(input)
    @input = input
  end

  def annotate
    @input.map_with_index do |row, row_idx|
      row.chars.map_with_index do |col, col_idx|
        mines = [-1, 0, 1].product([-1, 0, 1]).count { |x, y| ((@input + [""])[x + row_idx] + " ")[y + col_idx]? == '*' }
        mines == 0 || col != ' ' ? col : mines
      end.join
    end
  end
end
