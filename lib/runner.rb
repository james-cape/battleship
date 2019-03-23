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
# binding.pry
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
You now need to lay out your two ships.
The Cruiser is two units long and the Submarine is three units long.\n
#{user_board.render(true)}\n
Enter the squares for the Cruiser (i.e. A1 A2 A3):"

user_cells = gets.chomp # in format like A1 A2 A3
