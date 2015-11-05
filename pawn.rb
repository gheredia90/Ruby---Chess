class Pawn < Piece

	def valid_move?(board, initial_position, final_position)
		initial_row, initial_column = board.get_position(initial_position)
		final_row, final_column = board.get_position(final_position)
		pawn_color = board.get_piece(initial_position)[0]
		destination_color = board.get_piece(final_position)[0]
		valid_move = false
		free_space = false
		if pawn_color == 'w'
			valid_move, free_space = get_valid_pawn_moves(-1, final_row, initial_row, final_column, initial_column, pawn_color, destination_color)	
			if (initial_row == 6) && (final_row == 4) && (initial_column == final_column) && destination_color == '-'
				valid_move = true
				free_space = true
			end	
		end
		if pawn_color == 'b'	
			valid_move, free_space = get_valid_pawn_moves(1, final_row, initial_row, final_column, initial_column, pawn_color, destination_color)	
			if (initial_row == 1) && (final_row == 3) && (initial_column == final_column) && destination_color == '-'	
				valid_move = true
				free_space = true
			end	
		end	
		
		return [valid_move, free_space]		
		
	end

	def get_valid_pawn_moves(difference, final_row, initial_row, final_column, initial_column, pawn_color, destination_color)
		valid_move = false
		free_space = false
		if ((final_row - initial_row) == difference) && ((initial_column - final_column).abs == 1) && destination_color != '-'
				valid_move = true
				free_space = pawn_color == destination_color ? false : true
		end
		if ((final_row - initial_row) == difference) && (initial_column == final_column) && destination_color == '-'	
				valid_move =  true
				free_space = true
		end	
		
		return [valid_move, free_space]
	end

end