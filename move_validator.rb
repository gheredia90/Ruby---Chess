class MoveValidator

	def initialize(board, file_moves)
		@board = board
		file_content = IO.read(file_moves)
		moves = file_content.split (" ")
		@moves_grid = order_moves(moves)
	end	

	def order_moves(moves)
		number_of_moves = moves.size / 2
		i = 0
		@moves_grid = Array.new(number_of_moves) { Array.new(2) }		
		(0..number_of_moves - 1).each do |row|
      		(0..1).each do |cell|
        		@moves_grid[row][cell] = moves[i]
        		i += 1
      		end
    	end
    	display_moves
    	@moves_grid
	end	

	def display_moves
		i = 0
		number_of_moves = @moves_grid.size
		(0..number_of_moves - 1).each do |row|
      		(0..1).each do |cell|
        		print "#{@moves_grid[row][cell]} "
        		i += 1
      		end
      		puts ""
    	end
	end	

	def check_moves
		result = @moves_grid.map {|moves| puts check_move(moves[0], moves[1]) }
	end	

	def check_move(initial_position, final_position)
		piece_color, piece_type = @board.get_piece(initial_position)[0], @board.get_piece(initial_position)[1]
		destination_color = @board.get_piece(final_position)[0]
		free_space = piece_color == destination_color ? false : true 
		piece = create_piece(piece_color, piece_type)
		valid_move = piece.valid_move?(@board, initial_position, final_position)
		free_space && valid_move ? "LEGAL" : "ILLEGAL"
	end	

	def create_piece(piece_color, piece_type)
		case piece_type
		when "R"
			piece = Rook.new(piece_color)
		when "N"
			piece = Knight.new(piece_color)
		when "B"
			piece = Bishop.new(piece_color)	
		when "K"
			piece = King.new(piece_color)	
		when "Q"
			piece = Queen.new(piece_color)	
		when "P"
			piece = Pawn.new(piece_color)	
		else
			puts "Incorrect piece type"	
		end	
		piece
	end

end