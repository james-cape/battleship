require './lib/ship'

class Computer


  def initialize(board, ships)
    @board = board
    @computer_ships = ships


  end

  def feed_ships
    @computer_ships.each do |ship|

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

      has_overlapping = true
      while has_overlapping == true

        ship_footprint = all_combos.sample
        has_overlapping = ship_footprint.any? do |cell|
          # binding.pry
          @board.cells[cell].empty? == false
        end

      end
      @board.place(ship, ship_footprint)
    end
  end
end
