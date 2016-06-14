class Car
	def self.check_speed()
		puts "How fast are you driving right now?"
		speed = gets.chomp.to_i
		puts "YOu are driving too fast" if speed>100
	end
	def initialize(sound,capacity)
		@sound = sound
		@capacity = capacity
	end
	def make_noise()
		puts @sound
	end
end