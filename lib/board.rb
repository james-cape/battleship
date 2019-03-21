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

  def valid_placement?(ship, coordinate_array)
    coordinate_array.length == ship.length        &&

    ### Need to put this in a helper method.
    # Outputs potential column combinations.
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



  end

#### valid_placement?
#### Helper methods

  def all_columns
    # Can only handle less than 10 rows
    columns = []
    @cells.keys.each do |column|
      columns << column[0]
    end
    columns.uniq
    # => ["A", "B", "C", "D"]
    columns.uniq.each_cons(ship_length)
  end

  def all_rows
    # Can only handle less than 10 rows
    rows = []
    @cells.keys.each do |row|
      rows << row[1]
    end
    rows.uniq
    # => ["1", "2", "3", "4"]
  end

  def ship_columns(coordinate_array)

  end



  def ship_rows

  end
#### End valid_placement?
#### Helper methods

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
