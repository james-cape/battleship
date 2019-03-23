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
    @computer = Computer.new(@board)
  end

  def test_board_exists
    expected = Board
    actual = @board
    assert_instance_of expected, actual
  end

  def test_computer_exists
    expected = Computer
    actual = @computer
    assert_instance_of expected, actual
  end

  def test_computer_randomly_places_two_ships
    expected = 2
    actual = @computer.feed_ships
    assert_equal expected, actual
  end




  def test_computer_can_place_random_ships
    skip
    expected =
    actual =
    assert_instance_of expected, actual
  end

end
