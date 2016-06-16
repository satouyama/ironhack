class TextProcessor
	def initialize(input)
		@text = input
	end

	def count_words
		@text.split.size
	end
end