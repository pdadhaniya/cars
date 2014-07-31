

class Car

	@@total_car_count = 0
	@@cars_per_color = Hash.new

	def self.total_car_count #method belongs to the Car class because of self.
		@@total_car_count
	end

	def self.most_popular_color
		@@cars_per_color.select {|x, y| y == @@cars_per_color.values.max}.keys
		# goes through hash and finds the max value(s) and returns the max values' keys
	end
		
	def to_s()
		"I'm a car. I've driven #{@distance} miles and have #{@fuel} gallons of gas left."
	end

	def initialize(color="blue", convertible=false)
		@fuel = 10
		@distance = 0
		@color = color #color attribute when car is created
		if @@cars_per_color[color] #why color and not @color?
			@@cars_per_color[color] += 1 #updates the hash with an additional count of that color
		else
			@@cars_per_color[color] = 1 #if that color is not already in the hash, add its with a count 1
		end
		@@total_car_count += 1
	end

	def color=(new_color) #why can't we use attr_writer? because we need to update hash?
		@@cars_per_color[@color] -= 1 #decrements old color of instance by 1
		@color = new_color #setter method for new color
		if @@cars_per_color[@color] #if the new color is already in the hash
			@@cars_per_color[@color] += 1 #increments new color of instance by 1
		else
			@@cars_per_color[@color] = 1 #if new color is not in hash, value of new color will be 1
		end
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas and need to fuel up!"
		end
	end

	def fuel_up
		@cost = (10-@fuel) * 3.5
		puts "You filled #{@cost/3.5} gallons at a cost of $#{@cost}"
		@fuel = 10
	end
end

class ConvertibleCar < Car

	attr_accessor :roof_status

	def initialize(color="blue", convertible=true)
		super(color)
		@convertible = convertible
		@roof_status = "open"
	end

	def top_down
		@roof_status = "open"
	end

	def close_top
		@roof_status = "closed"
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