class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
      }

  end

  def valid_coordinate?(coordinate_array)
    @cells.keys.include?(coordinate_array)
  end

#### automate separating letters from numbers, including double digits.
  def column_combos(ship)
    columns = @cells.keys.map do |column|
      column[1]
    end

    columns.uniq.each_cons(ship.length).map do |combo|
      combo
    end
  end

  def row_combos(ship)
    rows = @cells.keys.map do |row|
      row[0].ord
    end
    rows.uniq.each_cons(ship.length).map do |combo|
      combo.map do |number|
        number.chr
      end
    end
  end

  def valid_placement?(ship, coordinate_array)
    column_combos = column_combos(ship)
    row_combos = row_combos(ship)

    ship_columns = coordinate_array.map do |coordinate|
      coordinate[1]
    end

    ship_rows = coordinate_array.map do |coordinate|
      coordinate[0]
    end

    columns_match = column_combos.any? do |column_combo|
      column_combo == ship_columns
    end

    rows_match = row_combos.any? do |row_combo|
      row_combo == ship_rows
    end

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
    rows = @cells.keys.map do |row|
      row[0]
    end.uniq

    columns = @cells.keys.map do |column|
      column[1]
    end.uniq

    rendered_string = "  #{columns.join(' ')} \n"
    rows.each do |row|
      rendered_string += "#{row} "
      columns.each do |column|
        rendered_string += "#{@cells["#{row}#{column}"].render(reveal)} "
      end
      rendered_string += "\n"
    end
    rendered_string
  end
end
