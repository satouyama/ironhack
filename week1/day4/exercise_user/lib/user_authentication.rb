class UserAuthentication
	@@username = "WEILI"
	@@password = "123456"

	def initialize(input_username,input_password)
		@input_username = input_username
		@input_password = input_password
	end
	def check_input
		if @input_username == @@username && @input_password == @@password
			return true
		else
			return false
		end
	end

end