

class Location
  attr_accessor(:description)
  def run
    puts @description
	@input = gets.chomp
  end
end
  

WIDTH = 2
HEIGHT = 2

scene = Array.new(WIDTH) { Array.new(HEIGHT) }
scene[0][0] = Location.new()

scene[0][0].description = "There's no place like home."


scene[0][0].run
