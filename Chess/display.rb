require_relative 'board'
require_relative 'cursor'
require 'colorize'
require 'byebug'

class Display
  def initialize(board)
    @cursor = Cursor.new([1,4],board)
    @board = board
  end
  def render
    system("clear")
    build_board.each {|row| puts row.join}
  end

  def testing
    while true
      render
      # debugger
      @cursor.get_input
    end
  end

  def build_board

    @board.grid.map.with_index do |row, i|
      display_row(row, i)
    end
  end

  def display_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if @cursor.cursor_pos == [i,j]
      backgr = :red
    elsif (i + j).odd?
      backgr = :light_black
    else
      backgr = :white
    end
    # backgr
    {:background => backgr}
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  display.testing
end
