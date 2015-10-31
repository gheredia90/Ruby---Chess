class Bishop < Piece

	def valid_move?(board, initial_position, final_position)
		initial_row, initial_column = board.get_position(initial_position)
		final_row, final_column = board.get_position(final_position)
		if (final_row - initial_row).abs == (final_column - initial_column).abs
			array_pieces = board.get_pieces_in_diagonal(initial_row, final_row, initial_column, final_column)
			path_cleared = board.empty_path?(array_pieces)
			return path_cleared
		end
		false
	end

end