module RetrieveData
	def retrieve
		file1 = File.open(data.txt, "r")
		contents = file1.read
		@real_info = eval(contents)
	end
end