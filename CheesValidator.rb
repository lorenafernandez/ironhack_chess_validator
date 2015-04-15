module ChessHelper

	def cheek_movement_rook
		if @column_origin == @column_destination
			'Rook LEGAL'
		elsif @row_origin == @row_destination
			'Rook LEGAL'
		else
			'Rook ILEGAL'
		end
	end

	def cheek_movement_bishop
		ascii
		advance_row = (@row_destination[0] - @row_origin[0]).abs
		advance_column = (@ascii_destination_column - @ascii_origin_column).abs
		if advance_column == advance_row
			'Bishop LEGAL'
		else
			'Bishop ILEGAL'
		end
	end

	def allowed_positions
		ascii
		@row_allowed = (@row_origin[0]-2..@row_origin[0]+2).to_a
		@row_allowed.delete_at(2)
		@column_allowed =(@ascii_origin_column-2..@ascii_origin_column+2).to_a
		@column_allowed.delete_at(2)
	end

end

class Piece
	include ChessHelper

	attr_accessor :origin, :destination, :colour
	def initialize (origin,destination,colour)
		@origin = origin
		@destination = destination
		@colour = colour
	end
	def horizontal_positions
		@column_origin = origin.keys
		@column_destination = destination.keys
		vertical_positions
	end
	def vertical_positions
		@row_origin = origin.values
		@row_destination = destination.values
		move
	end

	def ascii
		ascii_origin = @column_origin[0].bytes
		@ascii_origin_column = ascii_origin[0].to_i
		ascii_destination = @column_destination[0].bytes
		@ascii_destination_column = ascii_destination[0].to_i
	end
end



class Rook < Piece	
	def move
		cheek_movement_rook
	end
end

class Bishop < Piece
	def move
		cheek_movement_bishop
	end	
end

class Queen < Piece
	def move
		if cheek_movement_rook && cheek_movement_bishop
			'Queen LEGAL'
		else
			'Queen ILEGAL'
		end
	end
end

class King < Piece
	def move
		ascii
		row_allowed = (@row_origin[0]-1..@row_origin[0]+1).to_a
		valid_row = row_allowed.include?(@row_destination[0])
		column_allowed =(@ascii_destination_column[0]-1..@ascii_destination_column[0]+1).to_a
		valid_column = column_allowed.include?(@ascii_destination_column[0])
		if valid_row  && valid_column 
			'King LEGAL'
		else
			'King ILEGAL'
		end
	end
end

class Knight < Piece
	def move
		allowed_positions
		ascii
		if @row_allowed.include?(@row_destination[0])  &&  @column_allowed.include?(@ascii_destination_column)
			'Knight LEGAL'
		else
			'Knight ILEGAL'
		end
	end
end

class Pawn < Piece
	def move
		black = @row_destination == @row_origin[0] - 1 && @colour == 'black'
		white = @row_destination == @row_origin[0] + 1 && @colour == 'white'
		if ( black || white)
			'Pawn LEGAL'
		else
			'Pawn ILEGAL'
		end
	end
end

class Board
	def initialize(start_conditions)
		@start_conditions = start_conditions
	end

	def print_board(start_positions, final_positions)
		puts ''
		@start_conditions.each do |piece|
			print piece + ' '
		end
		puts ''
		read_board(start_positions, final_positions)
	end

	def read_board (start_positions, final_positions)
		index = -1
		@start_conditions.each do |piece|
			index +=1
			if piece[0] == 'b'
				my_color = 'black'
			else
				my_color = 'white'
			end	
			puts "Board " + Rook.new(start_positions[index],final_positions[index],my_color).horizontal_positions if piece[1]=='R'
			puts "Board " + Knight.new(start_positions[index],final_positions[index],my_color).horizontal_positions if piece[1]=='N'
		end
	end
end

rook1_black = Rook.new({'D' => 8},{'A' => 8},'black')
puts rook1_black.horizontal_positions

bishop1_black = Bishop.new({'A' => 6},{'C' => 8},'black')
puts bishop1_black.horizontal_positions

queen_black = Queen.new({'A' => 6},{'D' => 8},'black')
puts queen_black.horizontal_positions

king_black = King.new({'C' => 6},{'C' => 8},'black')
puts king_black.horizontal_positions

knight1_black = Knight.new({'C' => 6},{'D' => 8},'black')
puts knight1_black.horizontal_positions

pawn1_black = Pawn.new({'C' => 6},{'C' => 8},'black')
puts pawn1_black.vertical_positions

start_conditions = ['bR','bN', 'bB']
start_positions = [{'D' => 8},{'A' => 6}]
final_positions = [{'A' => 8},{'C' => 8},]


board = Board.new(start_conditions)
board.print_board(start_positions,final_positions)
