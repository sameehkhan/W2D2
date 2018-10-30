class Piece
attr_reader :color, :pos :symbol

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = []

  end


  def to_s

  end

  def empty?
    @pos == NullPiece
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
  def symbol
    if self.color == :black
      " ♟ "
    else
      ' ♙ '
    end
  end

  def move_dirs

  end

  private

  def at_start_row?
  end

  def forward_dir
    if self.color == :black
      return 1
    else
      return -1
    end
  end

  def forward_steps
  end

  def side_attacks
  end

end

class Rook < Piece
  include Slideable
  def symbol
    if self.color == :black
      " ♜ "
    else
      ' ♖ '
  end
end

class Bishop < Piece
  include Slideable
  def symbol
    if self.color == :black
      " ♝ "
    else
      ' ♗ '
    end
  end
end

class Queen < Piece
  include Slideable
  def symbol
    if self.color == :black
      " ♛ "
    else
      " ♕ "
    end
  end
end

class Knight < Piece
  include SteppingPiece
  def symbol
    if self.color == :black
      " ♞ "
    else
      " ♘ "
   end
  end
end

class King < Piece
  include SteppingPiece
  def symbol
    if self.color == :black
      " ♚ "
    else
      ' ♔ '
    end
  end
end

class NullPiece < Piece
  include Singleton
  def symbol
    " 🀫 "
  end
end

module SlidingPiece

  def moves
  end

  def horizontal_dirs
  end

  def diagonal_dirs

  end

  private

  HORIZONTAL_DIRS = (0..7).to_a
  DIAGONAL_DIRS = (0..7).to_a

  def move_dirs
  end

  def grow_unblocked_moves_in_dir(dx,dy)
  end

end

module SteppingPiece

  def moves
  end

  private
  def move_diffs

  end

end
