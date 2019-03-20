require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'


class BoardTest < Minitest::Test

  def setup
    @board_hash = {}
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
    actual = board.cells.keys[0] # <--- I hope I got this chain right.
    assert_equal expected, actual
  end

end
