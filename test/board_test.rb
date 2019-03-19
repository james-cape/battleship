require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

attr_reader :board

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_board_exists

    expected = Board
    actual = board
    assert_instance_of expected, actual
  end

  def test_board_is_a_hash #using board.kind_of?(Hash)
    skip
    expected = True
    actual = board.kind_of?(Hash)
    assert_equal expected, actual
  end

  def test_board_hash_has_16_key_value_pairs
    skip
    expected = 16
    actual = board.length
    assert_equal expected, actual
  end

  def test_16_board_hash_keys_point_to_cell_objects
    skip
    expected = true
    actual = board.keys.all? do |key|
      key.kind_of?(Object)
    end
    # hash.keys returns an array of keys.
    # hash.keys.any? looks through the array of keys
    # and says true if all the array are objects.
    assert_equal expected, actual
  end


  # =>
  {
   "A1" => #<Cell:0x00007ff0728a3f58...>,
   "A2" => #<Cell:0x00007ff0728a3ee0...>,
   "A3" => #<Cell:0x00007ff0728a3e68...>,
   "A4" => #<Cell:0x00007ff0728a3df0...>,
   "B1" => #<Cell:0x00007ff0728a3d78...>,
   "B2" => #<Cell:0x00007ff0728a3d00...>,
   "B3" => #<Cell:0x00007ff0728a3c88...>,
   "B4" => #<Cell:0x00007ff0728a3c10...>,
   "C1" => #<Cell:0x00007ff0728a3b98...>,
   "C2" => #<Cell:0x00007ff0728a3b20...>,
   "C3" => #<Cell:0x00007ff0728a3aa8...>,
   "C4" => #<Cell:0x00007ff0728a3a30...>,
   "D1" => #<Cell:0x00007ff0728a39b8...>,
   "D2" => #<Cell:0x00007ff0728a3940...>,
   "D3" => #<Cell:0x00007ff0728a38c8...>,
   "D4" => #<Cell:0x00007ff0728a3850...>
  }
end
