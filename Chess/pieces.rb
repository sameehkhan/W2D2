require_relative 'board'

class Piece
attr_reader :color, :pos, :symbol

  def initialize(color, pos)
    @color = color
    # @board = board
    @pos = []

  end
  def moves
    #returns an array of all possible positions a piece can move to
  end

  def to_s

  end

  def empty?(pos)
    pos == NullPiece
  end

  def valid_moves

  end

  def pos=(val)

  end

  def symbol

  end

  private

  def move_into_check?(end_pos)

  end

end


class Pawn < Piece
  def initialize
  end

  def to_s
    " ♟ "
  end

  def symbol
    self.color == :black ? " ♟ " : ' ♙ '
  end

  def move_dirs
    poss_moves = []
    loc = self.pos
    poss_moves << [loc[0] + 2, loc[1]] if at_start_row?
    poss_moves << [loc[0] + 1, loc[1]]
    poss_moves << [loc[0] + 1, loc[1] + 1] if [loc[0] + 1, loc[1] + 1].color != self.color
    poss_moves << [loc[0] + 1, loc[1] - 1] if [loc[0] + 1, loc[1] - 1].color != self.color
  end

  private

  def at_start_row?
    self.color == :white && self.pos[0] == 6 ? true : false
    self.color == :black && self.pos[0] == 1 ? true : false
  end

  def forward_dir
    self.color == :black ? 1 : -1
  end

  def forward_steps
    self.at_start_row? ? [1,2] : [1]
  end

  def diagonal_attacks

  end

end

class Rook < Piece
  # include Slideable
  def initialize(color, pos)
    @color = color
    @pos = []
  end
  def symbol
    self.color == :black ? " ♜ " : ' ♖ '
  end

  def to_s
    " ♜ "
  end
  def inspect
    " ♜ "
  end

end

class Bishop < Piece 
  # include Slideable
  def initialize(color, pos)
    @color = color
    @pos = []
  end
  def symbol
    self.color == :black ? " ♝ " : ' ♗ '
  end
  def to_s
    " ♝ "
  end

  def inspect
    " ♝ "
  end
end

class Queen < Piece
  # include Slideable
  def initialize(color, pos)
    @color = color
    @pos = []
  end
  def symbol
    self.color == :black ? " ♛ " : " ♕ "
  end
  def to_s
    " ♛ "
  end
  def inspect
    " ♛ "
  end
end

class Knight < Piece
  # include SteppingPiece
  def initialize(color, pos)
    @color = color
    @pos = []
  end
  def symbol
    self.color == :black ? " ♞ " : " ♘ "
  end
  def to_s
    " ♞ "
  end
  def inspect
    " ♞ "
  end
end
#
class King < Piece
  # include SteppingPiece
  def initialize(color, pos)
    @color = color
    @pos = []
  end
  def symbol
    self.color == :black ? " ♚ " : ' ♔ '
  end
  def to_s
    " ♚ "
  end
  def inspect
    " ♚ "
  end
end
#
# class NullPiece < Piece
#   include Singleton
#   def symbol
#     " 🀫 "
#   end
# end
#
# module SlidingPiece
#
#   def moves
#     move_dirs
#   end
#
#   def horizontal_dirs
#     HORIZONTAL_DIRS
#   end
#
#   def diagonal_dirs
#     DIAGONAL_DIRS
#   end
#
#   private
#
#   HORIZONTAL_DIRS = [
#     [0,1], #changes col
#     [0,-1], #changes col
#     [1,0], #changes row
#     [-1,0] #changes row
#   ]
#   DIAGONAL_DIRS = [
#     [1,1],
#     [1,-1],
#     [-1,1],
#     [-1,-1]
#   ]
#
#   def move_dirs
#   end
#
#   def grow_unblocked_moves_in_dir(dx,dy)
#   end
#
# end
#
# module SteppingPiece
#
#   def moves
#   end
#
#   private
#   def move_diffs
#
#   end
#
# end
