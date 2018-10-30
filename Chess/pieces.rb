class Piece
attr_reader :color, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = []

  end


  def to_s

  end

  def empty?

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
  end

  def forward_steps
  end

  def side_attacks
  end

end

class Rook < Piece
  def symbol
    if self.color == :black
      " ♜ "
    else
      ' ♖ '
  end
end

class Bishop < Piece
  def symbol
    if self.color == :black
      " ♝ "
    else
      ' ♗ '
    end
  end
end

class Queen < Piece
  def symbol
    if self.color == :black
      " ♛ "
    else
      " ♕ "
    end
  end
end

class Knight < Piece
  def symbol
    if self.color == :black
      " ♞ "
    else
      " ♘ "
   end
  end
end

class King < Piece
  def symbol
    if self.color == :black
      " ♚ "
    else
      ' ♔ '
    end
  end
end

class NullPiece < Piece
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
