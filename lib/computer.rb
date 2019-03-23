require './lib/ship'

class Computer


  def initialize(board)
    @board = board


  end

  def feed_ships
    [@cruiser = Ship.new("Cruiser", 3), @submarine = Ship.new("Submarine", 2)].each do |ship|


# @board.row_combos(ship)
# => [["A", "B", "C"], ["B", "C", "D"]]
# @board.column_combos(ship)
# => [["1", "2", "3"], ["2", "3", "4"]]

      possible_configurations = []
      possible_ship_footprint = []
      @board.row_combos(ship).each do |row_combo|
        row_combo.each do |row|
          @board.column_combos(ship).each do |col_combo|
            col_combo.each do |col|

              # binding.pry
              possible_ship_footprint << row + col
              # binding.pry
            end
            possible_configurations 
          end
        end
        possible_configurations
      end
      possible_configurations


      binding.pry
    end
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
