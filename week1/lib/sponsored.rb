class SponsoredPost < Post
	def title
		"****** #{@title} ******"
	end
end