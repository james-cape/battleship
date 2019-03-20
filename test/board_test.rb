require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'


class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @coordinates_array = [
              "A1", "A2", "A3", "A4",   # For now I'm hard coding
              "B1", "B2", "B3", "B4",
              "C1", "C2", "C3", "C4",
              "D1", "D2", "D3", "D4"   ]

    @cell_array = [
      cell_1 = Cell.new("A1"),
      cell_2 = Cell.new("A2"),
      cell_3 = Cell.new("A3"),
      cell_4 = Cell.new("A4"),
      cell_5 = Cell.new("B1"),
      cell_6 = Cell.new("B2"),
      cell_7 = Cell.new("B3"),
      cell_8 = Cell.new("B4"),
      cell_9 = Cell.new("C1"),
      cell_10 = Cell.new("C2"),
      cell_11 = Cell.new("C3"),
      cell_12 = Cell.new("C4"),
      cell_13 = Cell.new("D1"),
      cell_14 = Cell.new("D2"),
      cell_15 = Cell.new("D3"),
      cell_16 = Cell.new("D4")    ]

    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @range = 3..8

  end

  def test_board_exists
    skip
    expected = Board
    actual = @board_hash
    assert_instance_of expected, actual
  end

  def test_board_hash_has_16_key_value_pairs
    expected = 16
    actual = @board_hash.length
    #.length refers to key:value pairs, not the board length.
    assert_equal expected, actual
  end


  def test_board_is_a_hash #using board.kind_of?(Hash)
    skip
    expected = True
    actual = @board_hash.kind_of?(Hash)
    assert_equal expected, actual
  end


  def test_all_16_board_hash_keys_point_to_cell_objects
    skip
    expected = true

    actual = @board.values.all? do |val|
      val.kind_of?(Object)
    end
    # hash.values returns an array of values.
    # hash.values.any? looks through the array of values
    # and returns true if all are objects.
    assert_equal expected, actual
  end

  def test_first_key_value_pair_in_board_hash_is_A1
    skip

##### I accidentally wrote the method - just copy paste this into the ship.rb to solve this test.

#def cells
# i = 0
# until i >= @cells.count
#   @board[@coordinates[i]] = @cells[i]
#   i += 1
# end
#end

    expected = "A1"
    actual = @board.cells.keys[0] # <--- I hope I got this chain right.
    assert_equal expected, actual
  end


#### Validating Coordinates
  def test_whether_coordinate_is_on_board_or_not
    skip
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end


#### Validating Placements
  def test_number_of_coordinates_is_same_as_ship_length
    skip
    assert_equal false, @board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_coordinates_are_consecutive
    skip
    assert_equal false, @board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(submarine, ["C1", "B1"])
  end

  def test_coordinates_can_not_be_diagonal
    skip
    assert_equal false, @board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_previous_checks_pass_meaning_placement_should_be_valid
    skip
    assert_equal true, @board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end

  #### Ranges
  def test_range_exists
    skip
    range = 3..8

    expected = Range
    actual = range.class
    assert_equal expected, actual
  end


  def test_array_object
    skip
    range = 3..8
    # array = @range.to_a

    expected = [3, 4, 5, 6, 7, 8]
    actual = range.to_a
    assert_equal expected, actual
  end

  def test_array_length
    skip
    range = 3..8
    array = range.to_a

    expected = 6
    actual = array.length
    assert_equal expected, actual
  end

  def test_array_element
    skip
    range = 3..8
    array = range.to_a

    expected = 6
    actual = array[3]
    assert_equal expected, actual
  end

  def test_array_also_works_with_strings
    skip
    range = "A".."D"

    expected = "A".."D"
    actual = array.length
    assert_equal expected, actual
  end

  def test_array_also_works_with_strings_and_return_string
    skip
    range = "A".."D"

    expected = ["A", "B", "C", "D"]
    actual = range.to_a
    assert_equal expected, actual
  end

#### Ordinal values
# The Range with Strings works because each character has an implicit value that tells us in what order the characters should be. This is called the Ordinal Value, and you can access it with the ord method for Strings:

  def test_verify_ordinal_value

  end

end
