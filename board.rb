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
        		@grid[row][cell] = array[i]
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

	def human_move_to_coordinate(human_move)
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
      mapping[human_move]
    end	

    def get_move(human_move = gets.chomp)
      human_move_to_coordinate(human_move)
    end


end


