require_relative 'board'
require_relative 'cursor'
require 'colorize'
require 'byebug'

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0],board)
    @board = board
  end
  def render
    build_board.each {|row| puts row.join}
  end

  def build_board
    debugger
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
      :red
    elsif (i + j).odd?
      :yellow
    else
      :blue
    end

  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  p display.render
end
