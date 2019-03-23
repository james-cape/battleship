require './lib/ship'

class Computer


  def initialize(board)
    @board = board


  end

  def feed_ships

    computer_ships = [@cruiser = Ship.new("Cruiser", 3),
      @submarine = Ship.new("Submarine", 2)]

    computer_ships.each do |ship|
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
      y = possible_horizontal_configurations.uniq

      possible_vertical_configurations = []
      possible_ship_footprint = []

      @board.column_combos(ship).each do |col_combo|
        col_combo.each do |col|
          @board.row_combos(ship).each do |row_combo|
            row_combo.each do |row|
              possible_ship_footprint << row + col
            end
            possible_vertical_configurations << possible_ship_footprint
            possible_ship_footprint = []
          end
        end
      end
      x = possible_vertical_configurations.uniq
      all_combos = x + y

      computer_ships.each do |computer_ship|


        @board.place(computer_ship, all_combos.sample)

        all_combos = all_combos - @board.occupied_cells
        # Mutiliate all_combos so occupied cells are removed.


      end
      @board.render(true)
      binding.pry
    end
  end



end
