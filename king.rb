class King

	def valid_move?(board, initial_position, final_position)
		initial_row, initial_column = board.get_position(initial_position)
		final_row, final_column = board.get_position(final_position)
		if initial_row == final_row
			array_pieces = board.get_pieces_in_row(initial_row, initial_column, final_column)
		elsif initial_column == final_column
			array_pieces = board.get_pieces_in_column(initial_column, initial_row, final_row)
		end	
		path_cleared = board.empty_path?(array_pieces)
		path_cleared && ((initial_row == final_row) || (initial_column == final_column)) ? true : false
	end


end