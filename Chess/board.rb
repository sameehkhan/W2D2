require 'byebug'
require_relative 'pieces'
class Board

  attr_accessor :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    board_setup
  end

  def board_setup
    (0...@grid.length).each do |row|
      (0...@grid.length).each do |col|
        if row == 1 || row == 6
          @grid[row][col] = Pawn.new
        elsif row == 0 && col == 0 || row == 0 && col == 7 || row == 7 && col == 0 || row == 7 && col == 7
          @grid[row][col] = Rook.new
        elsif (0..1).include?(row) || (6..7).include?(row)
          @grid[row][col] = Piece.new
        else
          @grid[row][col] = NullPiece.new
        end
      end
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

    raise "No piece at this position!" if self[start_pos].is_a?(NullPiece)
    raise "You cannot move there!" unless self[end_pos].is_a?(NullPiece)

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
  end

  def valid_pos?(pos)
    return true if (0..7).include?(pos[0]) && (0..7).include?(pos[1])
    false
  end


end


class Piece

  def initialize

  end

  def inspect
    "♚"
  end

  def to_s
    " ♚ "

  end


end


class NullPiece < Piece

  def initialize


  end

  def to_s
    # " 🀫 "
    '   '
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.grid
  board.move_piece([0,0],[4,4])
  p board.grid

end
