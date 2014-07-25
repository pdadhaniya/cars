class Car

	@@total_car_count = 0
	@@cars_per_color = Hash.new

	# starting the method with self means it belongs to the class instead of the instance
	def self.total_car_count
		@@total_car_count
	end

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(color='blue', convertible=false)
		@fuel = 10
		@distance = 0
		@color = color # color attribute when car is created/initialized 
		@convertible = convertible # instance variable for convertible
		if @@cars_per_color[color]
			@@cars_per_color[color] += 1 #updates hash with color and increments count of color
		else 
			@@cars_per_color[color] = 1 #adds new color with value of 1
		end
		if @convertible #for convertibles, the roof will be open
			@roof_status = "roof is open"
		end
	end

	def top_down # method to open the roof for a convertible
		if @convertible
			@roof_status = "the roof of the convertible is opening"
		end
	end

	def close_top #method to close the roof of the convertible
		if @convertible
			@roof_status = "the roof of the convertible is closing"
		end
	end

	def color=(new_color)
		@@cars_per_color[@color] -= 1 #decrements count for old color; will this work?
		@color = new_color #setter for new color
		@@cars_per_color[@color] += 1 #increments count for new color
	end

	def self.most_popular_color #adding method for most_popular_color
		the_color = @@cars_per_color.max_by { |x, y| y }
		puts the_color
		#the code takes the value of the most popular but why is it putting color and value?
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end

car_a = Car.new()
car_b = Car.new()
puts car_a
puts car_b
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts car_a
puts car_b

best_color = Car.most_popular_color
Car.new(best_color)