require_relative("lib/input.rb")
require_relative("lib/Board.rb")
require_relative("lib/Chess.rb")
require_relative("lib/Rook.rb")
require_relative("lib/Pawn.rb")
require_relative("lib/King.rb")
require_relative("lib/Bishop.rb")
require_relative("lib/Knight.rb")
require_relative("lib/Queen.rb")




puts "Welcome to this boring Chess Game!"
puts "It is so boring. U sure u want to play? y/n "
enter_game = gets.chomp.upcase

puts "you don't have a choice" if enter_game == "N"
puts "-----------------------"
puts "-----------------------"
puts "X: 1,2,3,4,5,6,7,8"
puts "Y: 1,2,3,4,5,6,7,8"
puts "Sample input: 58 would be Black King(bKing)"
puts "-----------------------"
puts "-----------------------"



board1 = Board.new
board1.show



play_condition = true

while play_condition
	ori_cor = board1.ask_for_ori
	board_move_validity_ori = board1.check_board_valid(ori_cor)

	# a convert function might be more useful here because we are reusing it again and again and also it's pretty simple to set up

	# puts "value 0 #{index_x}"
	# puts index_y

	if !board_move_validity_ori
	#	puts "false condition"
		board1.prompt_valid
		next
	end
	#puts index_start_x
	#puts index_start_y
	des_cor = board1.ask_for_des
	board_move_validity_des = board1.check_board_valid(des_cor,1)

	if !board_move_validity_des
		board1.prompt_valid
		next
	end

	array_ori = board1.convert(ori_cor)
	array_des = board1.convert(des_cor)

	start_x = array_ori[0]
	start_y = array_ori[1]

	# obtaining x,y index from the string input
	index_start_x = array_ori[2]
	index_start_y = array_ori[3]

	final_x = array_des[0]
	final_y = array_des[1]

	index_final_x = array_des[2]
	index_final_y = array_des[3]

	#p array_ori
	#p array_des


	intended_piece = board1.grid[index_start_x][index_start_y]
	#puts "can move" if intended_piece.can_move?(final_x,final_y)
	#puts piece_name   # pice name obtained
	#puts intended_piece
	piece_move_validity = intended_piece.can_move?(final_x,final_y)
		#puts piece_move_validity

	if piece_move_validity == true
		puts "can move"
#		des_status = board1.check_empty(index_final_x,index_final_y)
#		if des_status == "empty"
		#puts "start moving"
		board1.move(intended_piece,index_start_x,index_start_y,index_final_x,index_final_y)
#		puts "call move function"
# 		else
# #				compare
# 			puts "call compare function"
# 		end
	else
		board1.prompt_valid
	end

	board1.show

end
 #puts board_move_validity

# check piece validity






# black_rook_right = Rook.new(8, 8, "black")

# puts "-------------"
# puts "Rook Tests"
# p black_rook_right.can_move?(8, 5) == true   # Vertical movement
# p black_rook_right.can_move?(4, 8) == true   # Horizontal movement
# p black_rook_right.can_move?(5, 5) == false  # Diagonal movement (invalid)
# p black_rook_right.can_move?(3, 6) == false  # Side diagonal movement? (invalid)


# king_black = King.new(5,8,"black")
# puts "-------------"
# puts "King Tests"
# p king_black.can_move?(4,7) == true # diagonal movement of 1
# p king_black.can_move?(5,7) == true # vertical movement of 1
# p king_black.can_move?(5,4) == false # vertical movment of 4
# p king_black.can_move?(1,8) == false # vertical movement of 4


# bishop_black = Bishop.new(6,8,"black")
# puts "------------"
# puts "Bishop Tests"
# p bishop_black.can_move?(4,6) == true # left diagonal of 2
# p bishop_black.can_move?(7,7) == true # right diagonal of 1
# p bishop_black.can_move?(6,7) == false # vertical
# p bishop_black.can_move?(5,8) == false #  horizontal

# knight_black = Knight.new(7,8,"black")
# puts "------------"
# puts "Knight Tests"
# p knight_black.can_move?(6,6) == true
# p knight_black.can_move?(5,7) == true
# p knight_black.can_move?(6,7) == false
# p knight_black.can_move?(7,7) == false


# queen_black = Queen.new(4,8,"black")
# puts "------------"
# puts "Queen Tests"
# p queen_black.can_move?(2,6) == true
# p queen_black.can_move?(1,8) == true
# p queen_black.can_move?(3,6) == false
# p queen_black.can_move?(8,7) == false



# black_pawn_right = Pawn.new(8,7,"black")

# puts "-------------"
# puts "Pawn Tests"
# p black_pawn_right.can_move?(8,5) == true # first vertical movement
# p black_pawn_right.can_move?(8,6) == true # vertical movment only 1 step
# p black_pawn_right.can_move?(7,7) == false # horizontal movement(invalid)
# p black_pawn_right.can_move?(7,7) == false # diagonal movement(invalid)





