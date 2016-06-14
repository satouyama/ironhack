class Car
	attr_accessor :cities
	def initialize(sound,capacity)
		@sound = sound
		@capacity = capacity
		@cities= []
	end
	def make_noise()
		puts @sound
	end
	def travel(city)
		@cities << city
	end
	def self.check_speed()
		puts "How fast are you driving right now?"
		speed = gets.chomp.to_i
		puts "YOu are driving too fast" if speed>100
	end
end