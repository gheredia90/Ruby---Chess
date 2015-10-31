require 'pry'

class Board

	def initialize(file)
		@grid = Array.new(8) { Array.new(8) }
		populate_grid(IO.read(file))		
	end	

	def populate_grid(file_content)
		array = file_content.split(" ")
		i = 0
		(0..7).each do |row|
      		(0..7).each do |cell|
        		@grid[row][cell] = array[i].to_sym
        		i += 1
      		end
    	end
    	display_grid
	end	

	def display_grid
		(0..7).each do |row|
      		(0..7).each do |cell|
        		print "#{@grid[row][cell]} "  
        	end
        	puts " "
    	end
	end	

	def get_piece(human_position)
		x, y = get_position(human_position)
		@grid[x][y]
	end	

	def get_pieces_in_row(row, initial_column, final_column)
		array_pieces = []		
		middle_columns = Array(initial_column..final_column).tap(&:pop).tap(&:shift)
		middle_columns.each {|column| array_pieces << @grid[row][column]}
		array_pieces
	end		

	def get_pieces_in_column(column, initial_row, final_row)
		array_pieces = []
		middle_rows = Array(initial_row..final_row).tap(&:pop).tap(&:shift)
		middle_rows.each {|row| array_pieces << @grid[row][column]}
		array_pieces
	end
	
	def get_pieces_in_diagonal(initial_row, final_row, initial_column, final_column)
	
	end	

	def empty_path?(array_pieces)
		array_pieces.each do |piece| 
			if piece.to_s != "--" 
				return false
			end	
		end		
		return true
	end	

	def human_move_to_coordinate(human_position)
      mapping = {}
      column = 0
      r = 8..1
      ("a".."h").each do |letter|
      	(r.first).downto(r.last).each do |number|
      		value = letter + number.to_s
      		mapping[value] = [8 - number, column]  
      	end	
      	column += 1
      end
      mapping[human_position]
    end	

    def get_position(human_position = gets.chomp)
      human_move_to_coordinate(human_position)
    end


end


