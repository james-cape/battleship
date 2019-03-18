require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'


class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_ship_exists
  expected = Ship
  actual = @cruiser
  assert_instance_of expected, actual
  end


end
