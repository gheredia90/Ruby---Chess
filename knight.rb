class Knight < Piece

	def valid_move?(board, initial_position, final_position)
		initial_row, initial_column = board.get_position(initial_position)
		final_row, final_column = board.get_position(final_position)
		(((final_row - initial_row).abs == 2) && ((final_column - initial_column).abs == 1)) || (((final_row - initial_row).abs == 1) && ((final_column - initial_column).abs == 2))
	end
end