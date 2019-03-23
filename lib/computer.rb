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

# Can come back later and iterate through just [1, 2, 3, 4] to get all
# potential vertical combos, and vice versa.

      possible_horizontal_configurations = []
      possible_ship_footprint = []
      @board.row_combos(ship).each do |row_combo|
        row_combo.each do |row|
          @board.column_combos(ship).each do |col_combo|
            col_combo.each do |col|
              possible_ship_footprint << row + col
            end
            possible_horizontal_configurations << possible_ship_footprint
            possible_ship_footprint = []
          end
        end
      end
      possible_horizontal_configurations.uniq!

    end
  
  end



end
