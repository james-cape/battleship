require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'pry'



ship_1 = Ship.new("Cruiser", 3)
ship_2 = Ship.new("Submarine", 2)
ships = []
ships << ship_1
ships << ship_2

user_board = Board.new
computer_board = Board.new

computer = Computer.new(computer_board, ships)


puts "Welcome to BATTLESHIP"
puts "Enter p to play. Enter q to quit."

play_or_quit = gets.chomp
# if play_or_quit = "p", computer places ships
# if play_or_quit = "q", program ends/exits.
computer.feed_ships

puts "I have laid out my ships on the grid.
You now need to lay out your #{ships.length} ships.
The Cruiser is two units long and the Submarine is three units long.\n
#{user_board.render(true)}\n"

ships.each do |ship|
  cells_on_grid = false
  cells_consecutive = false
  cells_overlap = true
  while cells_on_grid == false || cells_consecutive == false || cells_overlap == true

    puts "Enter #{ship.length} squares for the #{ship.name} (i.e. A1 A2 A3):"
    user_cells = gets.chomp.split(" ")

####### Decides _on_grid, _overlap, _consecutive
    user_cells.each do |cell|
      cells_on_grid = true if user_board.valid_coordinate?(cell)
      cells_overlap = false if user_board.cells[cell].empty?

    end
    cells_consecutive = true if user_board.valid_placement?(ship, user_cells)
########

    if cells_on_grid == false || cells_consecutive == false || cells_overlap == true

      puts "Those are invalid coordinates. Please try again: "
    else
      user_cells.each do |cell|
        user_board.cells[cell].place_ship(ship)
      end
    end
  end
end  # End of ships.each

# Both boards are displayed with user's ships showing.
puts "\n\n"
puts "=============COMPUTER BOARD============="
puts computer_board.render
puts "==============PLAYER BOARD=============="
puts user_board.render(true)
puts "\n\n"

# Player takes the first shot.
puts "Enter the coordinate for your shot: "
shot = gets.chomp

# if invalid, user is reprompted until they enter a valid one.
if computer_board.cells[shot].fired_upon == true || !computer_board.valid_coordinate?(shot)
  puts "Your shot was off the board or already fired upon. Please enter a valid coordinate"
  shot = gets.chomp
else
  if computer_board.cells[shot].empty?
    computer_board.cells[shot].fire_upon
    puts "Your shot on #{shot} was a miss."
  else
    computer_board.cells[shot].fire_upon
    puts "Your shot on #{shot} was a hit!"
    if computer_board.cells[shot].ship.sunk?
      puts "Your shot on #{shot} sunk the ship!"
    end
  end
end
# Both boards are displayed with user's ships showing.
puts "\n\n"
puts "=============COMPUTER BOARD============="
puts computer_board.render
puts "==============PLAYER BOARD=============="
puts user_board.render(true)
puts "\n\n"













#
