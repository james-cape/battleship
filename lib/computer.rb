class Computer

  def initialize(board, ships)
    @board = board
    @computer_ships = ships
  end

  def possible_vertical_footprints(ship)
    possible_vertical_footprints = []
    @board.ship_column_combos(ship).each do |col_combo|
      col_combo.each do |col|
        @board.ship_row_combos(ship).each do |row_combo|
          possible_ship_footprint = row_combo.map do |row|
            row + col
          end
          possible_vertical_footprints << possible_ship_footprint
          possible_ship_footprint = []
        end
      end
    end
    possible_vertical_footprints
  end

  def possible_horizontal_footprints(ship)
    possible_horizontal_footprints = []
    @board.ship_row_combos(ship).each do |row_combo|
      row_combo.each do |row|
        @board.ship_column_combos(ship).each do |col_combo|
          possible_ship_footprint = col_combo.map do |col|
            row + col
          end
          possible_horizontal_footprints << possible_ship_footprint
          possible_ship_footprint = []
        end
      end
    end
    possible_horizontal_footprints
  end

  def conditionally_place_ship(ship, all_combos)
    has_overlapping = true
    while has_overlapping == true
      ship_footprint = all_combos.sample
      has_overlapping = ship_footprint.any? do |cell|
        @board.cells[cell].empty? == false
      end
    end
    @board.place(ship, ship_footprint)
  end

  def feed_ships
    @computer_ships.each do |ship|
      all_combos = (possible_horizontal_footprints(ship) + possible_vertical_footprints(ship)).uniq
      conditionally_place_ship(ship,all_combos)
    end
  end
end
