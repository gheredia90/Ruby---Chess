class Rook

	def initialize(color)
		@color = color
	end
	
	def valid_move?(board, initial_position, final_position)
		initial_row, initial_column = board.get_position(initial_position)
		final_row, final_column = board.get_position(final_position)
		(initial_row == final_row) || (initial_column == final_column) ? true : false
	end	

end