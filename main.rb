class User #The user is an object, containing data and functions.
  attr_accessor :name , :x , :y, :input
  # User's Name
  @name
  # User's Coordinates
  @x
  @y
  def scene(location) #What the user sees.
    puts location[@x][@y].description
    puts
	@input = gets.chomp.upcase
	action(@input)
  end

  def action(input) #What the user can do.
    if @input == "N"
	  @y = @y - 1
	end
	if @input == "S"
	  @y = @y + 1
	end
	if @input == "E"
	  @x = @x + 1
	end
	if @input == "W"
	  @x = @x - 1
	end
  end
#End User Class
end

#Player/User Setup
user = User.new
user.name = "Bob"
user.x = 4
user.y = 4

class Location
  attr_accessor(:description)
end
  
WIDTH = 10
HEIGHT = 10

location = Array.new(WIDTH) { Array.new(HEIGHT) }

(0...WIDTH).each do |x|
  (0...HEIGHT).each do |y|
    location[x][y] = Location.new()
    location[x][y].description = "Location " + x.to_s() + "," + y.to_s()
  end
end

exit = false
while exit == false
  user.scene(location)
  if user.input == "EXIT"
    exit = true
  end
end
