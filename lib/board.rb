class Board
  attr_reader :cells, :occupied_cells

  def initialize
    @occupied_cells = []

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

  def valid_placement?(ship, coordinate_array)
    # moved to bottom until we can implement the helper methods
    # coordinate_array.length == ship.length

    ### Need to put this in a helper method.
    # Outputs potential column combinations.
    # Will not currently work for 10 or more rows.
    columns = []
    @cells.keys.each do |column|
      columns << column[1]
    end

    column_combos = []
    columns.uniq.each_cons(ship.length) do |combo|
      column_combos << combo
    end
    # => [["1", "2", "3"], ["2", "3", "4"]]
    ### ^ These are potential column combinations

    #### Need to put this in a helper method.
    # Outputs potential row combinations.
    rows = []
    @cells.keys.each do |row|
      rows << row[0].ord - 64
    end
    # rows => [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4]

    row_combos = []
    rows.uniq.each_cons(ship.length) do |combo|
      unscrambled_letters = []
      combo.each do |number|
        unscrambled_letters << (number + 64).chr
      end
      # => ["A", "B", "C"]

      row_combos << unscrambled_letters
    end
    row_combos
    # => [["A", "B", "C"], ["B", "C", "D"]]
    ### ^ These are potential row combinations

    ### Need to put this in a helper method.
    # Outputs array of columns the ship is in
    # coordinate_array refers to the argument coming in with valid_placement?
    ship_columns = []
    coordinate_array.each do |coordinate|
      ship_columns << coordinate[1]
    end
    ship_columns
    # => ["1", "2", "4"]

    ship_rows = []
    coordinate_array.each do |coordinate|
      ship_rows << coordinate[0]
    end
    ship_rows
    # => ["A", "A", "A"]

    ### Compare ship rows/columns with acceptable row/column arrays.
    columns_match = false
    rows_match = false

    column_combos.each do |column_combo|
      if column_combo == ship_columns
        columns_match = true
      end
    end


    row_combos.each do |row_combo|
      if row_combo == ship_rows
        rows_match = true
      end
    end


##### The actual conditional statement that matters.
    coordinate_array.length == ship.length &&
    ((rows_match == true && columns_match == false) ||
     (rows_match == false && columns_match == true)) &&
     coordinate_array.all? do |coordinate|
       @cells[coordinate].empty?
     end

#### Hopefully we can put everything else into helper methods.
  end

#### If placement is valid,
  def place(ship, coordinates_array)
    coordinates_array.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end


end

























  # def cells
  #   i = 0
  #   until i >= @cells_array.length
  #     # binding.pry
  #     @cells[@coordinates_array[i]] = @cells_array[i]
  #     i += 1
  #   end
  #   @cells
  # end

  # Stretch the board dot renders out because double digits will push dots into the wrong places
#
