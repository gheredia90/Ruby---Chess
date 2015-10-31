require_relative 'board.rb'
require_relative 'move_validator.rb'
require_relative 'rook.rb'

b = Board.new("simpler_board.txt")
puts ""

m = MoveValidator.new(b, "simpler_moves.txt")
puts ""
puts m.check_moves