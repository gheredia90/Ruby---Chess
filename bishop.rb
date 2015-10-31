class Bishop < Piece

	def valid_move?(board, initial_position, final_position)
		initial_row, initial_column = board.get_position(initial_position)
		final_row, final_column = board.get_position(final_position)
		(final_row - initial_row).abs == (final_column - initial_column).abs ? true : false
	end

end