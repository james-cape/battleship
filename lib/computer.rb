require './lib/ship'

class Computer


  def initialize(board, ship)
    @board = board
    @ship = ship
    @ships_array = []
  end

  def ships_array
    @ships_array << @ship
    # binding.pry
  end

  def pick_random_cell
    @board.cells.keys.sample
  end

  def random_cardinal_direction
    [1, 2, 3, 4].sample
  end

  def feed_ships
    [@cruiser = Ship.new("Cruiser", 3), @submarine = Ship.new("Submarine", 2)].each do |ship|
      #Pick a random allowable row/column 

  end

  # def generate_cell_names_with_ship
  #   ship_placed_on = []
  #   originator_cell = pick_random_cell
  #
  #   ship_placed_on << originator_cell
  #
  #   # originator_cell.split("")
  #   if random_cardinal_direction.odd?
  #     # binding.pry
  #     # shiplength each do |unit|
  #     #
  #     #   originator_cell.split("")[0].ord - 1
  #   else
  #     binding.pry
  #   end
  #
  # end

end
