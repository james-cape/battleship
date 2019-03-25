require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'pry'

class ComputerTest < Minitest::Test

  def setup
    @board          = Board.new
    @ship_1         = Ship.new("Cruiser", 3)
    @ship_2         = Ship.new("Submarine", 2)
    @computer_ships = []
    @computer_ships << @ship_1
    @computer_ships << @ship_2
    @computer       = Computer.new(@board, @computer_ships)
  end

  def test_board_exists
    expected = Board
    actual   = @board
    assert_instance_of expected, actual
  end

  def test_computer_exists
    expected = Computer
    actual   = @computer
    assert_instance_of expected, actual
  end

  def test_computer_randomly_places_two_ships
    expected = 2
    actual   = @computer.feed_ships.length
    assert_equal expected, actual
  end

end
