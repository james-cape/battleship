require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class ShipTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_ship_exists
    expected = Ship
    actual = @cruiser

    assert_instance_of expected, actual
  end

  def test_ship_has_a_name
    expected = "Cruiser"
    actual = @cruiser.name
    assert_equal expected, actual
  end

  def test_ship_has_a_length
    expected = 3
    actual = @cruiser.length
    assert_equal expected, actual
  end

  def test_ship_starts_with_3_health
    expected = 3
    actual = @cruiser.health
    assert_equal expected, actual
  end

  def test_ship_starts_not_sunk
    expected = false
    actual = @cruiser.sunk?
    assert_equal expected, actual
  end

  def test_ship_health_after_one_hit
    @cruiser.hit

    expected = 2
    actual = @cruiser.health
    assert_equal expected, actual
  end

  def test_ship_health_after_two_hits
    @cruiser.hit
    @cruiser.hit

    expected = 1
    actual = @cruiser.health
    assert_equal expected, actual
  end

  def test_ship_not_sunk_after_two_hits
    @cruiser.hit
    @cruiser.hit

    expected = false
    actual = @cruiser.sunk?
    assert_equal expected, actual
  end

  def test_ship_sunk_after_three_hits
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit

    expected = true
    actual = @cruiser.sunk?
    assert_equal expected, actual
  end

end
