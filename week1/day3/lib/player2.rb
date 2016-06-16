class Player
	attr_accessor :position, :exit_condition
	def initialize
		@position = [0,0]
		@direction_code = {
			"E" => 1,
			"S" => 1,
			"N" => -1,
			"W" => -1
		}
		@exit_condition = "not_found"
	end
	def move(input1)
      input = input1.upcase
  		if input == "N" || input == "S"
  			@position[0] += @direction_code[input]
        #puts "position value changed"
  			if @position[0] == 4 
  				@position[0] =3
  				puts "You ran into Wall and you are KILLED"
  				@exit_condition= "dead"
  			elsif @position[0] ==-1
  				@position[0] =0
  				puts "You ran into Wall and you are KILLED"
				@exit_condition= "dead"  			
			   end
  		elsif input == "W" || input =="E"
  			@position[1] += @direction_code[input]
  			if @position[1] == -1
  				@position[1] =0
  				puts "You ran into Wall and you are KILLED"
  				@exit_condition= "dead"
  			elsif @position[1] == 4
  				@position[1] =3
  				puts "You ran into Wall and you are KILLED"
  				@exit_condition= "dead"
        end
      else
      #   puts "input not matched N S W E"
         @exit_condition ="special"
  		end
	end
	# def special_condition(input,space)
	# 	space.check_special(input)
	# end

	# def check_current_exit space
	# 	if @position[0] == 0 && @position[1] == 0
	# 		exits = "S E"
	# 	elsif @position[0] ==3 && @position[1] == 0
	# 		exits = "N E"
	# 	elsif @position[0] ==0 && @position[1] == 3
	# 		exits = "W S"
	# 	elsif @position[0] ==3 && @position[1] == 3
	# 		exits = "N W"
	# 	elsif @position[0] == 0
	# 		exits = "W S E"
	# 	elsif @position[0] == 3
	# 		exits = "N E W"
	# 	elsif @position[1] == 0
	# 		exits = "S N E"
	# 	elsif @position[1] == 3
	# 		exits = "W S N"
	# 	else 
	# 		exits = "N S W E"
	# 	end
	# 	puts "You can take these exits: #{exits}"	


	# 	ask_direction space
	# 	@exit_condition
	# end
	# def ask_direction space
		
	# 	puts "Which way do you want to go?"
	# 	input = gets.chomp.upcase
	# 	move(input, space)
	# end
end


=begin
	
function checkState(rover){
  for (var a in rover.position){
      switch(rover.position[a]){
        case -1:
          rover.position[a] = 9;
          break;
        case 10:
          rover.position[a]= 0;
          break;
      }
  }
}
var codeBook = {
	"f":1,
	"b":-1,
}
var codeBookDirection = {
	"N":1,
	"S":-1,
	"E":-1,
	"W":1
}

function move(input,rover) {
  switch(rover.direction) {
    case 'N': 
    case 'S':
      rover.position[0] = rover.position[0] + codeBook[input] * codeBookDirection[rover.direction]
      break;
    case 'E':
    case 'W':
      rover.position[1] = rover.position[1] - codeBook[input] * codeBookDirection[rover.direction]
      break;
  };
  checkState(rover);
  console.log("New Rover Position: [" + rover.position[0] + ", " + rover.position[1] + "]" + "and facing " + rover.direction )
}

/*function goBackward(rover) {
  switch(rover.direction) {
    case 'N':
      rover.position[0]--
      break;
    case 'E':
      rover.position[1]--
      break;
    case 'S':
      rover.position[0]++
      break;
    case 'W':
      rover.position[1]++
      break;
  };
  checkState(rover);
  console.log("New Rover Position: [" + rover.position[0] + ", " + rover.position[1] + "]"+ "and facing " + rover.direction )
}*/
function turn(rover) {
  switch(rover.direction) {
    case 'N':
      rover.direction = "W"
      break;
    case 'E':
      rover.direction = "N"
      break;
    case 'S':
      rover.direction = "E"
      break;
    case 'W':
      rover.direction = "S"
      break;
  };

  console.log("New Rover Position: [" + rover.position[0] + ", " + rover.position[1] + "]"+ "and facing " + rover.direction )
}

function turnRight(rover) {
  switch(rover.direction) {
    case 'N':
      rover.direction = "E"
      break;
    case 'E':
      rover.direction = "S"
      break;
    case 'S':
      rover.direction = "W"
      break;
    case 'W':
      rover.direction = "N"
      break;
  };

  console.log("New Rover Position: [" + rover.position[0] + ", " + rover.position[1] + "]"+ "and facing " + rover.direction )
}
function moveNow(input,rover){
  for(var i =0; i<input.length;i++){
     switch(input[i]){
      case "f":
      case "b":
        move(input[i],rover)
        break;
      case "l":
      	turnLeft(rover);
      case "r":
        turnRight(rover)
        break;
      default:
        alert('what do you want again?');
    }
  }
}

moveNow(input,myRover);

	
=end