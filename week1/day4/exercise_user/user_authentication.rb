class UserAuthentication
#	@@username = "WEILI"
#	@@password = "123456"
	include RetrieveData

	def initialize(input_username,input_password)
		@input_username = input_username
		@input_password = input_password
		@real_info
	# realistically what would happen is that I would search for that username in the database
	# there would be a function here to search for username in database. 
	# Would that function belong to another class? Would the function be in the initialization function?


	end
	def check_input
		if @input_username == @real_info[:Username] && @input_password == @real_info[:Password]
			return true
		else
			return false
		end
	end



end