class User #The user is an object, containing data and functions.
  attr_accessor :name , :x , :y, :input, :inventory
  
  def initialize( name , x , y )
    @name = name
    @x = x ; @y = y
    @item = ""
  end
  
  def scene(location) #What the user sees.
    system('cls')
    puts location[@x][@y].description
    puts location[@x][@y].item
    puts
    @input = gets.chomp.upcase
    puts
    action(@input, location)
  end

  def action(input, location) #What the user can do.
    if @input == "HELP"
#      system('cls')
      puts "Commands:"
      puts "n"
      puts "s"
      puts "e"
      puts "w"
      puts "inv"
      puts "take"
      puts "drop"
      puts "exit"
      @input = gets.chomp.upcase
      action(@input, location)
    elsif @input == "EXIT"
    elsif @input == "N"
      @y = @y - 1
    elsif @input == "S"
      @y = @y + 1
    elsif @input == "E"
      @x = @x + 1
    elsif @input == "W"
      @x = @x - 1
    elsif @input == "INV"
      puts @item
      gets
    elsif @input == "TAKE" and location[@x][@y].item != ""
      @item = location[@x][@y].item
      puts "Taking up " + @item + "..."
      location[@x][@y].item = ""
  #    @input = gets.chomp.upcase
  #    action(@input, location)
       gets
    elsif @input == "DROP" and @item != ""
      location[@x][@y].item = @item
      puts "Dropping " + @item + "..."
      @item = ""
  #    @input = gets.chomp.upcase
  #    action(@input, location)
      gets
    else
#      system('cls')
      puts "Type 'help' for a list of commands."
      @input = gets.chomp.upcase
      action(@input, location)
    end
  end
#End User Class
end


class Location
  attr_accessor(:description, :item)
end
  
WIDTH = 10
HEIGHT = 10

#Player/User Setup
puts "Enter your name"
name = gets.chomp
user = User.new(name,4,4)

#Initial Map
location = Array.new(WIDTH) { Array.new(HEIGHT) }

(0...WIDTH).each do |x|
  (0...HEIGHT).each do |y|
    location[x][y] = Location.new()
    location[x][y].description = "Location " + x.to_s() + "," + y.to_s()
    location[x][y].item = ""
  end
end

location[4][4].item = "Torch"
location[4][4].description += " - Home."

#class Item
#  attr_accessor(:name,:description)
#end


#########################################################################
#                              MAIN LOOP                                #
#########################################################################
exit = false
while exit == false

  user.scene(location)
  
  if user.input == "EXIT"
    exit = true
  end
  
end
