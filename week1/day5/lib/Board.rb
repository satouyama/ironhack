class Board
	include Input

	attr_reader :grid
	def initialize

		@turn = 0

		bR = Rook.new(1,8,"black","B5")
		bK = Knight.new(2,8,"black","B4")
		bB = Bishop.new(3,8,"black","B3")
		bQ = Queen.new(4,8,"black","B2")
		bKing = King.new(5,8,"black","B1")
		bB2 = Bishop.new(6,8,"black","B3")
		bK2 = Knight.new(7,8,"black","B4")
		bR2 = Rook.new(8,8,"black","B5")

		wR = Rook.new(1,1,"white","W5")
		wK = Knight.new(2,1,"white","W4")
		wB = Bishop.new(3,1,"white","W3")
		wQ = Queen.new(4,1,"white","W2")
		wKing = King.new(5,1,"white","W1")
		wB2 = Bishop.new(6,1,"white","W3")
		wK2 = Knight.new(7,1,"white","W4")
		wR2 = Rook.new(8,1,"white","W5")

		bP1 = Pawn.new(1,7,"black","BP")
		bP2 = Pawn.new(2,7,"black","BP")
		bP3 = Pawn.new(3,7,"black","BP")
		bP4 = Pawn.new(4,7,"black","BP")
		bP5 = Pawn.new(5,7,"black","BP")
		bP6 = Pawn.new(6,7,"black","BP")
		bP7 = Pawn.new(7,7,"black","BP")
		bP8 = Pawn.new(8,7,"black","BP")

		wP1 = Pawn.new(1,2,"white","WP")
		wP2 = Pawn.new(2,2,"white","WP")
		wP3 = Pawn.new(3,2,"white","WP")
		wP4 = Pawn.new(4,2,"white","WP")
		wP5 = Pawn.new(5,2,"white","WP")
		wP6 = Pawn.new(6,2,"white","WP")
		wP7 = Pawn.new(7,2,"white","WP")
		wP8 = Pawn.new(8,2,"white","WP")

		@grid = [
			[bR,bK,bB,bQ,bKing,bB2,bK2,bR2],
			[bP1,bP2,bP3,bP4,bP5,bP6,bP7,bP8],
			[nil] * 8,
			[nil] * 8,
			[nil] * 8,
			[nil] * 8,
			[wP1,wP2,wP3,wP4,wP5,wP6,wP7,wP8],
			[wR,wK,wB,wQ,wKing,wB2,wK2,wR2],	
		]


	end


	def check_empty(final_x,final_y)
		@grid[final_x][final_y] ? @grid[final_x][final_y] : "empty"
	end


	def show
		puts "Current Board Status:"
		@grid.each do |row|
			row.each do |element|
				print "|#{ element ? element.name : "00"}|"

			end
			print "\n"
		end
	end
	def prompt_valid
		puts "Plz input valid coordinates for the piece"
		puts "-----------------------"
		puts "-----------------------"
		puts "X: 1,2,3,4,5,6,7,8"
		puts "Y: 1,2,3,4,5,6,7,8"
		puts "Sample input: 58 would be B1 / Black King(bKing)"
		puts "-----------------------"
		puts "-----------------------"
	end

	def move piece, index_start_x, index_start_y, index_des_x, index_des_y
		#puts index_start_x,index_start_y,index_des_x,index_des_y
		#puts "destination original value #{@grid[index_des_x][index_des_y]}"
		#puts "destination become #{@grid[index_des_x][index_des_y].name}"
		#puts "original is #{@grid[index_des_x][index_des_y].name}"
		@grid[index_des_x][index_des_y] = piece.clone
		@grid[index_des_x][index_des_y].start_x = index_start_y + 1
		@grid[index_des_x][index_des_y].start_y = 8 - index_start_x
		@grid[index_start_x][index_start_y] = nil
		if @turn ==1
			@turn = 0
		elsif @turn == 0
			@turn = 1
		end
			
	end

	def compare

	end
end