require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class ShipTest < Minitest::Test
  attr_reader :cruiser
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_ship_exists

    expected = Ship
    actual = cruiser #Removed the "@" by adding attr_reader
    assert_instance_of expected, actual
  end

  def test_ship_has_a_name
    skip
    expected = "Cruiser"
    actual = cruiser.name
    assert_equal expected, actual
  end

  def test_ship_has_a_length
    skip
    expected = 3
    actual = cruiser.length
    assert_equal expected, actual
  end

  def test_ship_starts_with_3_health
    skip
    expected = 3
    actual = cruiser.health
    assert_equal expected, actual
  end

  def test_ship_starts_not_sunk
    skip
    expected = false
    actual = cruiser.sunk?
    assert_equal expected, actual
  end

  def test_ship_health_after_one_hit
    skip
    cruiser.hit

    expected = 2
    actual = cruiser.health
    assert_equal expected, actual
  end

  def test_ship_health_after_two_hits
    skip
    cruiser.hit
    cruiser.hit

    expected = 1
    actual = cruiser.health
    assert_equal expected, actual
  end

  def test_ship_not_sunk_after_two_hits
    skip
    cruiser.hit
    cruiser.hit

    expected = false
    actual = cruiser.sunk
    assert_equal expected, actual
  end

  def test_ship_sunk_after_three_hits
    skip
    cruiser.hit
    cruiser.hit
    cruiser.hit

    expected = true
    actual = cruiser.sunk?
    assert_equal expected, actual
  end

end
