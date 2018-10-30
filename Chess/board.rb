require 'byebug'

class Board

  attr_accessor :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def board_setup
    (0...@grid.length).each do |row|
      (0...@grid.length).each do |col|
        if (0..1).include?(row) || (6..7).include?(row)
          @grid[row][col] = Piece.new
        else
          @grid[row][col] = NullPiece.new
        end
      ends
    end
  end

  def []=(pos, value)
    row,col = pos.first, pos.last
    @grid[row][col] = value
  end


  def [](pos)
    row,col = pos.first, pos.last
    @grid[row][col]
  end

  def move_piece(start_pos, end_pos)
    debugger
    raise "No piece at this position!" if self[start_pos].is_a?(NullPiece)
    raise "You cannot move there!" if self[end_pos].is_a?(Piece)

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
  end


end


class Piece

  def initialize

  end

  def inspect
    "#{self.class}"
  end


end


class NullPiece < Piece

  def initialize


  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.board_setup
  board.grid
  p board.move_piece([0,0],[4,4])

end
