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
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @computer = Computer.new
  end



  def test_board_exists
    expected = Board
    actual = @board
    assert_instance_of expected, actual
  end


  def test_cruiser_exists
    expected = Ship
    actual = @cruiser
    assert_instance_of expected, actual
  end

  def test_computer_exists
    expected = Computer
    actual = @computer
    assert_instance_of expected, actual
  end





end