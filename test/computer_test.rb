require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'pry'

class ComputerTest < Minitest::Test

  def setup
    @board = Board.new


    @computer_ships = []
    @computer = Computer.new(@board, @computer.ships_array)
  end

  def test_board_exists
    expected = Board
    actual = @board
    assert_instance_of expected, actual
  end

  # def test_cruiser_exists
  #   expected = Ship
  #   actual = @cruiser
  #   assert_instance_of expected, actual
  # end

  def test_computer_exists
    expected = Computer
    actual = @computer
    assert_instance_of expected, actual
  end

  def test_computer_random_cell
    assert_instance_of String, @computer.pick_random_cell
  end

  def test_random_cardinal_direction
    assert_instance_of Integer, @computer.random_cardinal_direction
  end



  def test_extends_cells_to_length_of_ship
    expected = Array
    actual = @computer.generate_cell_names_with_ship
    assert_instance_of expected, actual
  end



  def test_computer_can_place_random_ships
    skip
    expected =
    actual =
    assert_instance_of expected, actual
  end

end
