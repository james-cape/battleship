class Board
  attr_reader :cells, :rows, :columns

  def initialize(height = 4, width = 4)
    @rows = ("A"..(height.to_i + 64).chr).to_a #height => ["A", "B", "C", "D"]
    @columns = ("1"..width.to_s).to_a #width => ["1", "2", "3", "4"]

    @cells = {}
    @columns.each do |column|
      @rows.each do |row|
        @cells[(row + column.to_s)] = Cell.new(row + column.to_s)
      end
    end
  end

  def valid_coordinate?(coordinate_array)
    @cells.keys.include?(coordinate_array)
  end

  def column_combos(ship)
    @columns.each_cons(ship.length).map do |combo|
      combo
    end
  end

  def row_combos(ship)
    @rows.each_cons(ship.length).map do |combo|
      combo.map do |number|
        number.chr
      end
    end
  end

  def valid_placement?(ship, coordinate_array)
    column_combos = column_combos(ship)
    row_combos = row_combos(ship)

    # .scan goes through the string ("A10") and looks for
    # blocks of character types (digits vs non-digits in our case).
    # It then puts each block in an array.
    # What is (/\d+|\D+/)
    # \D is any non-digit
    # \d is any digit
    # The "+" is "one or more of"
    # The /...|.../ are the "beginning", "or", and "end" of the regex.

    # We can now validate user placing ships on double digit coordinates.
    ship_columns = coordinate_array.map do |coordinate|
      coordinate.scan(/\d+|\D+/)[1]
    end

    ship_rows = coordinate_array.map do |coordinate|
      coordinate.scan(/\d+|\D+/)[0]
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
    rendered_string = "   "

    columns.each do |column|
      if column.to_i < 10
        rendered_string += "#{column.rjust(2,'0')} "
      else
        rendered_string += "#{column} "
      end
    end
    rendered_string += "\n"

    @rows.each do |row|
      rendered_string += "#{row}  "
      @columns.each do |column|
        rendered_string += "#{@cells["#{row}#{column}"].render(reveal)}  "
      end
      rendered_string += "\n"
    end
    rendered_string
  end
end
