require_relative 'board.rb'
require_relative 'move_validator.rb'
require_relative 'piece.rb'
require_relative 'rook.rb'
require_relative 'bishop.rb'
require_relative 'king.rb'
require_relative 'knight.rb'


b = Board.new("simpler_board.txt")
puts ""

m = MoveValidator.new(b, "simpler_moves.txt")
puts ""
puts m.check_moves
puts ""