class Board
  attr_reader :cells,
              :rows,
              :columns

  def initialize(height = 4, width = 4)
    @rows = ("A"..(height.to_i + 64).chr).to_a
    @columns = ("1"..width.to_s).to_a
#decide on max
    @cells = {}
    @rows.each do |row|
      @columns.each do |column|
        @cells[(row + column.to_s)] = Cell.new(row + column.to_s)
      end
    end
  end

  def ship_column_combos(ship)
    @columns.each_cons(ship.length).map do |combo|
      combo
    end
  end

  def ship_row_combos(ship)
    @rows.each_cons(ship.length).map do |combo|
      combo.map do |number|
        number.chr
      end
    end
  end

  def valid_placement?(ship, coordinate_array)

    ship_rows = coordinate_array.map do |coordinate|
      coordinate.scan(/\d+|\D+/)[0]
    end

    rows_match = ship_row_combos(ship).any? do |row_combo|
      row_combo == ship_rows
    end

    ship_columns = coordinate_array.map do |coordinate|
      coordinate.scan(/\d+|\D+/)[1]
    end

    columns_match = ship_column_combos(ship).any? do |ship_column_combo|
      ship_column_combo == ship_columns
    end


    check_conditionals(ship, coordinate_array, rows_match, columns_match)
  end

  def valid_coordinate?(coordinate_array)
    @cells.keys.include?(coordinate_array)
  end

  def check_conditionals(ship, coordinate_array, rows_match, columns_match)
    coordinate_array.length == ship.length &&
    ((rows_match == true && columns_match == false) ||
    (rows_match == false && columns_match == true)) &&
    coordinate_array.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def place(ship, coordinates_array)
    coordinates_array.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def render(reveal = false)
    rendered_string = "      "
    @columns.each do |column|
        rendered_string += "#{column.rjust(2,' ')} "
    end
    rendered_string += "\n"
    @rows.each do |row|
      rendered_string += "    #{row}  "
      @columns.each do |column|
        rendered_string += "#{@cells["#{row}#{column}"].render(reveal)}  "
      end
      rendered_string += "\n"
    end
    rendered_string
  end
end
