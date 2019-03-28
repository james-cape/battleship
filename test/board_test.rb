require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new

    @cruiser   = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)


    @cell_1 = @board.cells["A1"]
    @cell_2 = @board.cells["A2"]
    @cell_3 = @board.cells["A3"]
  end

  def test_board_exists
    expected = Board
    actual   = @board
    assert_instance_of expected, actual
  end

  def test_board_has_16_key_value_pairs
    expected = 16
    actual   = @board.cells.length

    assert_equal expected, actual
  end

  def test_board_is_a_hash
    expected = true
    actual   = @board.cells.kind_of?(Hash)
    assert_equal expected, actual
  end


  def test_all_16_board_keys_point_to_cell_objects
    expected = true
    actual   = @board.cells.values.all? do |val|
      val.kind_of?(Object)
    end
    assert_equal expected, actual
  end

  def test_first_key_value_pair_in_board_is_A1
    expected = "A1"
    actual   = @board.cells.keys[0]
    assert_equal expected, actual
  end

  def test_whether_coordinate_is_on_board_or_not
    assert_equal true,  @board.valid_coordinate?("A1")
    assert_equal true,  @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_number_of_coordinates_is_same_as_ship_length
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_coordinates_are_consecutive
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
  end

  def test_coordinates_can_not_be_diagonal
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_previous_checks_pass_meaning_placement_should_be_valid
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_same_ship_is_on_cell_2_and_cell_3
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @cell_1.ship
    @cell_2.ship
    @cell_3.ship

    expected = true
    actual  = @cell_3.ship == @cell_2.ship
    assert_equal expected, actual
  end

  def test_ships_cannot_overlap
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @cell_1.ship
    @cell_2.ship
    @cell_3.ship

    expected = false
    actual = @board.valid_placement?(@submarine, ["A1", "B1"])
    assert_equal expected, actual
  end

  def test_board_rendering
    @board.place(@cruiser, ["A1", "A2", "A3"])

    expected =  "       1  2  3  4 \n" +
                "    A  .  .  .  .  \n" +
                "    B  .  .  .  .  \n" +
                "    C  .  .  .  .  \n" +
                "    D  .  .  .  .  \n"

    actual = @board.render
    assert_equal expected, actual
  end

  def test_board_rendering_with_optional_true____the_S
    @board.place(@cruiser, ["A1", "A2", "A3"])

    expected =  "       1  2  3  4 \n" +
                "    A  S  S  S  .  \n" +
                "    B  .  .  .  .  \n" +
                "    C  .  .  .  .  \n" +
                "    D  .  .  .  .  \n"

    actual = @board.render(true)
    assert_equal expected, actual
  end

end
